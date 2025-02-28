/*
 * @flow strict-local
 * Copyright (C) 2020 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import mutate from 'mutate-cow';
import * as React from 'react';

import FormRowNameWithGuessCase, {
  type ActionT as NameActionT,
  type StateT as NameStateT,
  createInitialState as createNameState,
  runReducer as runFormRowNameWithGuessCaseReducer,
} from '../edit/components/FormRowNameWithGuessCase.js';

function reducer(
  state: NameStateT,
  action: NameActionT,
): NameStateT {
  const ctx = mutate(state);
  runFormRowNameWithGuessCaseReducer(ctx, action);
  return ctx.final();
}

export component RecordingName(
  field: FieldT<string>,
  recording: {+entityType: 'recording', +name: string},
) {
  /*
   * State must be moved higher up in the component hierarchy once more
   * of the page is converted to React.
   */
  const [state, dispatch] = React.useReducer(
    reducer,
    field,
    createNameState,
  );

  return (
    <FormRowNameWithGuessCase
      dispatch={dispatch}
      entity={recording}
      field={state.field}
      guessCaseOptions={state.guessCaseOptions}
      guessFeat
      isGuessCaseOptionsOpen={state.isGuessCaseOptionsOpen}
    />
  );
}

/*
 * Hydration must be moved higher up in the component hierarchy once
 * more of the page is converted to React.
 */
export default (hydrate<React.PropsOf<RecordingName>>(
  'div.recording-name',
  RecordingName,
): component(...React.PropsOf<RecordingName>));
