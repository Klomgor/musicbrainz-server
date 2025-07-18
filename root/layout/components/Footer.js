/*
 * @flow strict
 * Copyright (C) 2015 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import * as React from 'react';

import {DONATE_URL} from '../../constants.js';
import {CatalystContext} from '../../context.mjs';
import * as DBDefs from '../../static/scripts/common/DBDefs.mjs';
import {bracketedText}
  from '../../static/scripts/common/utility/bracketed.js';
import formatUserDate from '../../utility/formatUserDate.js';
import {returnToCurrentPage} from '../../utility/returnUri.js';

component Footer() {
  const $c = React.useContext(CatalystContext);
  const stash = $c.stash;
  return (
    <div id="footer">
      <p className="left" id="footer-menu">
        <a className="internal" href={DONATE_URL}>{l('Donate')}</a>
        <a className="internal" href="//wiki.musicbrainz.org/">{l('Wiki')}</a>
        <a className="internal" href="https://community.metabrainz.org/">{l('Forums')}</a>
        <a className="internal" href="/doc/Communication/ChatBrainz">
          {l('Chat')}
        </a>
        <a className="internal" href="http://tickets.metabrainz.org/">{l('Bug tracker')}</a>
        <a className="internal" href="https://blog.metabrainz.org/">{l('Blog')}</a>
        <a className="internal" href="https://mastodon.social/@MusicBrainz">{l('Mastodon')}</a>
        <a className="internal" href="https://bsky.app/profile/musicbrainz.org">{l('Bluesky')}</a>

        {DBDefs.BETA_REDIRECT_HOSTNAME ? (
          <a
            className="internal"
            href={
              '/set-beta-preference?' + returnToCurrentPage($c)
            }
          >
            {DBDefs.IS_BETA
              ? l('Stop using beta site')
              : l('Use beta site')}
          </a>
        ) : null}

        {$c.stash.legacy_browser === true ? (
          <a
            className="internal"
            href={'/toggle-legacy-browser?' + returnToCurrentPage($c)}
          >
            {l('Disable legacy browser mode')}
          </a>
        ) : null}
      </p>

      <p className="right">
        {exp.l(
          `Brought to you by {MeB|MetaBrainz Foundation} and our
           {spon|sponsors} and {supp|supporters}.`,
          {
            MeB: 'https://metabrainz.org/',
            spon: 'https://metabrainz.org/sponsors',
            supp: 'https://metabrainz.org/supporters',
          },
        )}

        {DBDefs.DB_STAGING_SERVER && DBDefs.GIT_BRANCH ? (
          <>
            <br />
            {exp.l('Running: {git_details}', {
              git_details: (
                <span
                  className="tooltip"
                  key="git_details"
                  title={DBDefs.GIT_MSG}
                >
                  {DBDefs.GIT_BRANCH}
                  {' '}
                  {bracketedText(DBDefs.GIT_SHA)}
                </span>
              ),
            })}
            {DBDefs.IS_BETA ? (
              <>
                {' '}
                {exp.l(
                  'See {tickets|all tickets in beta testing}.',
                  {tickets: 'https://tickets.metabrainz.org/issues/?filter=10715'},
                )}
              </>
            ) : null}
          </>
        ) : null}

        {nonEmpty(stash.last_replication_date) ? (
          <>
            <br />
            {texp.l('Last replication packet received at {datetime}', {
              datetime: $c.user
                ? formatUserDate($c, stash.last_replication_date)
                : stash.last_replication_date,
            })}
          </>
        ) : null}
      </p>
    </div>
  );
}

export default Footer;
