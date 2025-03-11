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
  RelationshipLinkTypeGroupT,
} from '../types.js';
import type {RelationshipEditorActionT} from '../types/actions.js';

import RelationshipPhraseGroup from './RelationshipPhraseGroup.js';

component _RelationshipLinkTypeGroup(
  dialogLocation: RelationshipDialogLocationT | null,
  dispatch: (RelationshipEditorActionT) => void,
  linkTypeGroup: RelationshipLinkTypeGroupT,
  releaseHasUnloadedTracks: boolean,
  source: RelatableEntityT,
  targetType: RelatableEntityTypeT,
  track: TrackWithRecordingT | null,
) {
  const elements = [];
  for (const linkPhraseGroup of tree.iterate(linkTypeGroup.phraseGroups)) {
    elements.push(
      <RelationshipPhraseGroup
        backward={linkTypeGroup.backward}
        dialogLocation={
          (
            dialogLocation != null &&
            dialogLocation.textPhrase === linkPhraseGroup.textPhrase
          ) ? dialogLocation : null
        }
        dispatch={dispatch}
        key={linkPhraseGroup.textPhrase}
        linkPhraseGroup={linkPhraseGroup}
        linkTypeId={linkTypeGroup.typeId}
        releaseHasUnloadedTracks={releaseHasUnloadedTracks}
        source={source}
        targetType={targetType}
        track={track}
      />,
    );
  }
  return elements;
}

const RelationshipLinkTypeGroup:
  component(...React.PropsOf<_RelationshipLinkTypeGroup>) =
  React.memo(_RelationshipLinkTypeGroup);

export default RelationshipLinkTypeGroup;
