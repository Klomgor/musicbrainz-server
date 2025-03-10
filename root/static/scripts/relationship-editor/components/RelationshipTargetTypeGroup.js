/*
 * @flow strict-local
 * Copyright (C) 2022 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import * as React from 'react';
import * as tree from 'weight-balanced-tree';

import type {
  RelationshipDialogLocationT,
  RelationshipLinkTypeGroupsT,
} from '../types.js';
import type {RelationshipEditorActionT} from '../types/actions.js';
import {getLinkTypeGroupKey} from '../utility/updateRelationships.js';

import RelationshipLinkTypeGroup from './RelationshipLinkTypeGroup.js';

component _RelationshipTargetTypeGroup(
  dialogLocation: RelationshipDialogLocationT | null,
  dispatch: (RelationshipEditorActionT) => void,
  linkTypeGroups: RelationshipLinkTypeGroupsT,
  releaseHasUnloadedTracks: boolean,
  source: RelatableEntityT,
  targetType: RelatableEntityTypeT,
  track: TrackWithRecordingT | null,
) {
  const elements = [];
  for (const linkTypeGroup of tree.iterate(linkTypeGroups)) {
    elements.push(
      <RelationshipLinkTypeGroup
        dialogLocation={
          (
            dialogLocation != null &&
            dialogLocation.linkTypeId === linkTypeGroup.typeId &&
            dialogLocation.backward === linkTypeGroup.backward
          ) ? dialogLocation : null
        }
        dispatch={dispatch}
        key={getLinkTypeGroupKey(
          linkTypeGroup.typeId,
          linkTypeGroup.backward,
        )}
        linkTypeGroup={linkTypeGroup}
        releaseHasUnloadedTracks={releaseHasUnloadedTracks}
        source={source}
        targetType={targetType}
        track={track}
      />,
    );
  }
  return elements;
}

const RelationshipTargetTypeGroup:
  component(...React.PropsOf<_RelationshipTargetTypeGroup>) =
  React.memo(_RelationshipTargetTypeGroup);

export default RelationshipTargetTypeGroup;
