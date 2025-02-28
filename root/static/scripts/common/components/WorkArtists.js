/*
 * @flow strict
 * Copyright (C) 2020 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import ArtistCreditLink from './ArtistCreditLink.js';
import CollapsibleList from './CollapsibleList.js';

const buildWorkArtistRow = (artistCredit: ArtistCreditT) => {
  return (
    <li key={artistCredit.id}>
      <ArtistCreditLink artistCredit={artistCredit} />
    </li>
  );
};

component WorkArtists(artists: ?$ReadOnlyArray<ArtistCreditT>) {
  return (
    <CollapsibleList
      ariaLabel={l('Work artists')}
      buildRow={buildWorkArtistRow}
      className="work-artists"
      rows={artists}
      showAllTitle={l('Show all artists')}
      showLessTitle={l('Show less artists')}
      toShowAfter={0}
      toShowBefore={4}
    />
  );
}

export default (hydrate<React.PropsOf<WorkArtists>>(
  'div.work-artists-container',
  WorkArtists,
): component(...React.PropsOf<WorkArtists>));
