m4_include(`macros.m4')m4_dnl
FROM phusion/baseimage:jammy-1.0.1 AS build

SHELL ["/bin/bash", "-c"]

RUN useradd --create-home --shell /bin/bash musicbrainz

WORKDIR /home/musicbrainz

set_perl_install_args

set_cpanm_and_carton_env

set_cpanm_install_args

run_with_apt_cache \
    --mount=type=bind,source=docker/nodesource_pubkey.txt,target=/etc/apt/keyrings/nodesource.asc \
    --mount=type=bind,source=docker/pgdg_pubkey.txt,target=/etc/apt/keyrings/pgdg.asc \
    keep_apt_cache && \
    apt_install(``ca-certificates curl gnupg software-properties-common'') && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.asc] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && \
    echo "deb [signed-by=/etc/apt/keyrings/pgdg.asc] http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt_install(`m4_dnl
        mbs_build_deps
        mbs_javascript_deps
        mbs_run_deps
        mbs_translations_deps
        test_db_build_deps
        chrome_for_testing_deps
        search_deps
        selenium_caa_deps
        expect
        locales
        openssh-client
        postgresql-16
        postgresql-16-pgtap
        redis-server
        runit
        runit-systemd
        sudo
        unzip
        ') && \
    rm -f /etc/apt/sources.list.d/nodesource.list \
        /etc/apt/sources.list.d/pgdg.list && \
    systemctl disable rabbitmq-server && \
    install_ts && \
    install_perl && \
    install_cpanm_and_carton && \
    python3.13 -m ensurepip --upgrade && \
    echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen && \
    locale-gen && \
    # Allow the musicbrainz user execute any command with sudo.
    # Primarily needed to run rabbitmqctl.
    echo 'musicbrainz ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    sudo -E -H -u musicbrainz mkdir MBS_ROOT

ENV JAVA_HOME=/usr/local/jdk \
    PATH=/usr/local/jdk/bin:$PATH \
    PGHOME=/var/lib/postgresql \
    PGDATA=/var/lib/postgresql/data \
    TERM=ansi \
    `MBS_ROOT'=MBS_ROOT

FROM build AS pgdata

RUN mkdir -p "$PGDATA" && \
    chown -R postgres:postgres "$PGHOME" && \
    cd "$PGHOME" && \
    chmod 700 "$PGDATA" && \
    sudo -u postgres /usr/lib/postgresql/16/bin/initdb \
        --data-checksums \
        --encoding utf8 \
        --locale en_US.UTF8 \
        --username postgres \
        --pgdata "$PGDATA" && \
    sudo -E -H -u postgres touch "$PGDATA"/pg_ident.conf

COPY --chown=postgres:postgres \
    docker/musicbrainz-tests/pg_hba.conf \
    docker/musicbrainz-tests/postgresql.conf \
    "$PGDATA"/

FROM build AS pg_amqp

ARG PG_AMQP_COMMIT=240d477

RUN git clone --depth 1 https://github.com/omniti-labs/pg_amqp.git && \
    cd pg_amqp && \
    git reset --hard $PG_AMQP_COMMIT && \
    mkdir target && \
    make && \
    make install DESTDIR=target

FROM build AS mb_solr

ARG OPENJDK_VERSION=17.0.11+9 \
    OPENJDK_SRC_SUM=aa7fb6bb342319d227a838af5c363bfa1b4a670c209372f9e6585bd79da6220c \
    MB_SOLR_TAG=v4.1.0

RUN curl -sSLO https://github.com/adoptium/temurin17-binaries/releases/download/jdk-${OPENJDK_VERSION/+/%2B}/OpenJDK17U-jdk_x64_linux_hotspot_${OPENJDK_VERSION/+/_}.tar.gz && \
    echo "$OPENJDK_SRC_SUM *OpenJDK17U-jdk_x64_linux_hotspot_${OPENJDK_VERSION/+/_}.tar.gz" | sha256sum --strict --check - && \
    tar xzf OpenJDK17U-jdk_x64_linux_hotspot_${OPENJDK_VERSION/+/_}.tar.gz && \
    mv "jdk-$OPENJDK_VERSION" /usr/local/jdk && \
    rm OpenJDK17U-jdk_x64_linux_hotspot_${OPENJDK_VERSION/+/_}.tar.gz

# Steps taken from https://github.com/metabrainz/mb-solr/blob/master/Dockerfile
RUN sudo -E -H -u musicbrainz git clone --branch $MB_SOLR_TAG --depth 1 --recursive https://github.com/metabrainz/mb-solr.git && \
    cd mb-solr/mmd-schema/brainz-mmd2-jaxb && \
    # Assume that Java classes have been regenerated and patched
    find src/main/java -type f -print0 | xargs -0 touch && \
    mvn --batch-mode install && \
    cd ../../mb-solr && \
    mvn --batch-mode package -DskipTests

FROM build AS sir

ARG SIR_TAG=v4.0.1

RUN sudo -E -H -u musicbrainz git clone --branch $SIR_TAG --depth 1 https://github.com/metabrainz/sir.git && \
    cd sir && \
    sudo -E -H -u musicbrainz sh -c 'python3.13 -m venv venv; . venv/bin/activate; pip install -r requirements.txt'

COPY docker/musicbrainz-tests/sir-config.ini sir/config.ini
COPY docker/musicbrainz-tests/log_solr_data.patch \
    docker/musicbrainz-tests/sir_nullpool.patch \
    docker/musicbrainz-tests/sir_retry_ttl.patch \
    sir/

RUN cd sir && \
    git apply log_solr_data.patch && \
    git apply sir_nullpool.patch && \
    git apply sir_retry_ttl.patch

FROM build AS artwork_indexer

ARG ARTWORK_INDEXER_COMMIT=209e463

RUN sudo -E -H -u musicbrainz git clone https://github.com/metabrainz/artwork-indexer.git && \
    cd artwork-indexer && \
    sudo -E -H -u musicbrainz git reset --hard $ARTWORK_INDEXER_COMMIT

COPY docker/musicbrainz-tests/artwork-indexer-config.ini artwork-indexer/config.ini

FROM build AS artwork_redirect

ARG ARTWORK_REDIRECT_COMMIT=98ac770

RUN sudo -E -H -u musicbrainz git clone https://github.com/metabrainz/artwork-redirect.git && \
    cd artwork-redirect && \
    sudo -E -H -u musicbrainz git reset --hard $ARTWORK_REDIRECT_COMMIT && \
    sudo -E -H -u musicbrainz sh -c 'python3.13 -m venv venv; . venv/bin/activate; pip install -r requirements.txt'

COPY docker/musicbrainz-tests/artwork-redirect-config.ini artwork-redirect/config.ini

FROM build AS node_modules

COPY --chown=musicbrainz:musicbrainz .yarnrc.yml package.json yarn.lock MBS_ROOT/
RUN cd MBS_ROOT && \
    corepack enable && \
    sudo -E -H -u musicbrainz yarn

FROM build

COPY --chown=musicbrainz:musicbrainz cpanfile cpanfile.snapshot MBS_ROOT/
# Install Perl module dependencies for MusicBrainz Server
RUN with_cpanm_cache \
    chown_mb(``/home/musicbrainz/.cpanm'') && \
    chown_mb(``$PERL_CARTON_PATH'') && \
    cd MBS_ROOT && \
    sudo -E -H -u musicbrainz carton install --deployment

COPY --from=mb_solr /usr/local/jdk/ /usr/local/jdk/
RUN update-alternatives --install /usr/bin/java java /usr/local/jdk/bin/java 10000 && \
    update-alternatives --set java /usr/local/jdk/bin/java

ARG SOLR_VERSION=9.7.0
ARG SOLR_SRC_SUM=a80417a79c8371d2049868573927c587b4a5b7b37e938ca6e64e8a8842449f49eddc987968ddad5d6b6b1f4395990c1edc4576a884b3a62c4fbcd97091a659d9

RUN curl -sSLO http://archive.apache.org/dist/solr/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz && \
    echo "$SOLR_SRC_SUM *solr-$SOLR_VERSION.tgz" | sha512sum --strict --check - && \
    tar xzf solr-$SOLR_VERSION.tgz solr-$SOLR_VERSION/bin/install_solr_service.sh --strip-components=2 && \
    ./install_solr_service.sh solr-$SOLR_VERSION.tgz && \
    rm install_solr_service.sh solr-$SOLR_VERSION.tgz && \
    systemctl disable solr

COPY --from=mb_solr --chown=solr:solr /home/musicbrainz/mb-solr/mb-solr/target/mb-solr-*.jar /opt/solr/lib/
COPY --from=mb_solr --chown=solr:solr /home/musicbrainz/mb-solr/mbsssss/ /var/solr/data/mycores/mbsssss/
COPY --from=mb_solr --chown=musicbrainz:musicbrainz /home/musicbrainz/mb-solr/mmd-schema/ /home/musicbrainz/mmd-schema/

RUN curl -sSLO https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/135.0.7049.42/linux64/chrome-linux64.zip && \
    unzip chrome-linux64.zip -d /opt && \
    rm chrome-linux64.zip

RUN curl -sSLO https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/135.0.7049.42/linux64/chromedriver-linux64.zip && \
    unzip chromedriver-linux64.zip -d /tmp && \
    mv /tmp/chromedriver-linux64/chromedriver /usr/local/bin/ && \
    chmod +x /usr/local/bin/chromedriver && \
    rm -r chromedriver-linux64.zip /tmp/chromedriver-linux64

RUN curl -sSLO https://github.com/validator/validator/releases/download/20.6.30/vnu.jar_20.6.30.zip && \
    unzip -d vnu -j vnu.jar_20.6.30.zip && \
    rm vnu.jar_20.6.30.zip

COPY --from=artwork_indexer --chown=musicbrainz:musicbrainz /home/musicbrainz/artwork-indexer/ /home/musicbrainz/artwork-indexer/
RUN sudo -E -H -u musicbrainz python3.13 -m pip install --user --no-warn-script-location 'pipx==1.7.1' && \
    sudo -E -H -u musicbrainz env PATH="/home/musicbrainz/.local/bin:$PATH" pipx install --python python3.13 'poetry==2.1.3' && \
    cd /home/musicbrainz/artwork-indexer && \
    sudo -E -H -u musicbrainz env PATH="/home/musicbrainz/.local/bin:$PATH" poetry install && \
    cd -

COPY --from=pgdata --chown=postgres:postgres "$PGHOME"/ "$PGHOME"/
COPY --from=pg_amqp --chown=musicbrainz:musicbrainz /home/musicbrainz/pg_amqp/target/ /
COPY --from=sir --chown=musicbrainz:musicbrainz /home/musicbrainz/sir/ /home/musicbrainz/sir/
COPY --from=artwork_redirect --chown=musicbrainz:musicbrainz /home/musicbrainz/artwork-redirect/ /home/musicbrainz/artwork-redirect/
COPY --from=node_modules --chown=musicbrainz:musicbrainz MBS_ROOT/node_modules/ MBS_ROOT/node_modules/
COPY --chmod=0755 docker/musicbrainz-tests/service/ /etc/service/

COPY --chmod=0755 \
    docker/scripts/start_template_renderer.sh \
    /usr/local/bin/

RUN setup_test_service(`artwork-indexer') && \
    setup_test_service(`artwork-redirect') && \
    setup_test_service(`chrome') && \
    setup_test_service(`postgresql') && \
    setup_test_service(`redis') && \
    setup_test_service(`solr') && \
    setup_test_service(`ssssss') && \
    setup_test_service(`template-renderer') && \
    setup_test_service(`vnu') &&\
    setup_test_service(`website')

LABEL org.opencontainers.image.source=https://github.com/metabrainz/musicbrainz-server
