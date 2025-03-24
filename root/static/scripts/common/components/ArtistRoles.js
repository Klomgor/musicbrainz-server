/*
 * @flow strict
 * Copyright (C) 2018 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import {commaOnlyListText} from '../i18n/commaOnlyList.js';
import localizeArtistRoles from '../i18n/localizeArtistRoles.js';

import CollapsibleList from './CollapsibleList.js';
import EntityLink from './EntityLink.js';

type RelationT = {
  +credit: string,
  +entity: ArtistT,
  +roles: $ReadOnlyArray<string>,
};

const buildArtistRoleRow = (relation: RelationT) => {
  return (
    <li key={relation.entity.id + '-' + relation.credit}>
      {exp.l('{artist} ({roles})', {
        artist: (
          <EntityLink
            content={relation.credit}
            entity={relation.entity}
          />
        ),
        roles: commaOnlyListText(localizeArtistRoles(relation.roles)),
      })}
    </li>
  );
};

component ArtistRoles(relations: $ReadOnlyArray<RelationT>) {
  return (
    <CollapsibleList
      ariaLabel={l('Artist roles')}
      buildRow={buildArtistRoleRow}
      className="artist-roles"
      rows={relations}
      showAllTitle={l('Show all artists')}
      showLessTitle={l('Show less artists')}
      toShowAfter={0}
      toShowBefore={4}
    />
  );
}

export default (hydrate<React.PropsOf<ArtistRoles>>(
  'div.artist-roles-container',
  ArtistRoles,
): component(...React.PropsOf<ArtistRoles>));
