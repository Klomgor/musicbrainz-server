/*
 * @flow strict-local
 * Copyright (C) 2019 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import CleanupBanner from '../components/CleanupBanner.js';
import manifest from '../static/manifest.mjs';
import Annotation from '../static/scripts/common/components/Annotation.js';
import Relationships
  from '../static/scripts/common/components/Relationships.js';
import WikipediaExtract
  from '../static/scripts/common/components/WikipediaExtract.js';
import formatSetlist from '../static/scripts/common/utility/formatSetlist.js';

import EventLayout from './EventLayout.js';

component EventIndex(
  eligibleForCleanup: boolean,
  event: EventT,
  numberOfRevisions: number,
  wikipediaExtract: WikipediaExtractT,
) {
  const setlist = event.setlist;

  return (
    <EventLayout entity={event} page="index">
      {eligibleForCleanup ? (
        <CleanupBanner entityType="event" />
      ) : null}
      <Annotation
        annotation={event.latest_annotation}
        collapse
        entity={event}
        numberOfRevisions={numberOfRevisions}
      />
      <WikipediaExtract
        cachedWikipediaExtract={wikipediaExtract || null}
        entity={event}
      />
      <Relationships source={event} />
      {nonEmpty(setlist) ? (
        <>
          <h2 className="setlist">{l('Setlist')}</h2>
          <p className="setlist">
            {formatSetlist(setlist)}
          </p>
        </>
      ) : null}
      {manifest('event/index', {async: true})}
    </EventLayout>
  );
}

export default EventIndex;
