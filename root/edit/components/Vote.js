/*
 * @flow strict
 * Copyright (C) 2018 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import * as React from 'react';

import {
  EDIT_VOTE_ABSTAIN,
  EDIT_VOTE_NO,
  EDIT_VOTE_NONE,
  EDIT_VOTE_YES,
} from '../../constants.js';
import {CatalystContext} from '../../context.mjs';
import DBDefs from '../../static/scripts/common/DBDefs.mjs';
import FormSubmit from '../../static/scripts/edit/components/FormSubmit.js';
import {
  editorMayVoteOnEdit,
  getLatestVoteForEditor,
} from '../../utility/edit.js';

type VoteCheckboxProps = {
  +edit: GenericEditWithIdT,
  +label: string,
  +name: string,
  +user: UnsanitizedEditorT,
  +value: number,
};

const VoteCheckbox = ({
  edit,
  user,
  label,
  name,
  ...props
}: VoteCheckboxProps) => {
  const latestVote = user
    ? getLatestVoteForEditor(edit, user)
    : null;
  const checked =
    (latestVote && latestVote.vote == props.value) ||
    (!latestVote && props.value === EDIT_VOTE_NONE);
  return (
    <label htmlFor={`id-${name}-${label}`}>
      <input
        defaultChecked={checked}
        id={`id-${name}-${label}`}
        name={name}
        type="radio"
        {...props}
      />
      {label}
    </label>
  );
};

type VoteProps = {
  +edit: GenericEditWithIdT,
  +index?: number,
  +summary?: boolean,
};

const Vote = ({
  edit,
  index = 0,
  summary = false,
}: VoteProps): React$Element<'div'> | null => {
  const $c = React.useContext(CatalystContext);
  const user = $c.user;
  if (DBDefs.DB_READ_ONLY || !user || !editorMayVoteOnEdit(edit, user)) {
    return null;
  }
  const props = {
    edit,
    name: 'enter-vote.vote.' + String(index) + '.vote',
    user,
  };
  return (
    <div className="voteopts">
      <div className="vote">
        <VoteCheckbox
          label={lp('Yes', 'vote')}
          value={EDIT_VOTE_YES}
          {...props}
        />
      </div>
      <div className="vote">
        <VoteCheckbox
          label={lp('No', 'vote')}
          value={EDIT_VOTE_NO}
          {...props}
        />
      </div>
      <div className="vote">
        <VoteCheckbox
          label={lp('Abstain', 'vote')}
          value={EDIT_VOTE_ABSTAIN}
          {...props}
        />
      </div>
      <div className="vote">
        <VoteCheckbox
          label={l('None')}
          value={EDIT_VOTE_NONE}
          {...props}
        />
      </div>
      {summary ? null : <FormSubmit label={l('Submit vote and note')} />}
    </div>
  );
};

export default Vote;
