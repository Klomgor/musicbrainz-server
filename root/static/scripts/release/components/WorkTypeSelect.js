/*
 * @flow strict
 * Copyright (C) 2021 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import * as React from 'react';

import linkedEntities from '../../common/linkedEntities.mjs';
import buildOptionList from '../../common/utility/buildOptionList.js';
import parseIntegerOrNull from '../../common/utility/parseIntegerOrNull.js';

export type WorkTypeSelectActionT = {
  +type: 'update-work-type',
  +workType: number | null,
};

function workTypeValue(workType: number | null): string {
  if (workType == null) {
    return '';
  }
  return String(workType);
}

component _WorkTypeSelect(
  dispatch: (WorkTypeSelectActionT) => void,
  initialFocusRef?: {-current: HTMLElement | null},
  workType: number | null,
) {
  const workTypeOptions: OptionListT = React.useMemo(() => {
    const workTypes: $ReadOnlyArray<WorkTypeT> =
      Object.values(linkedEntities.work_type);

    return buildOptionList(workTypes, l_languages);
  }, []);

  const handleWorkTypeChange = React.useCallback((
    event: SyntheticEvent<HTMLSelectElement>,
  ) => {
    dispatch({
      type: 'update-work-type',
      workType: parseIntegerOrNull(event.currentTarget.value),
    });
  }, [dispatch]);

  return (
    <tr>
      <td className="section">{addColonText(l('Work type'))}</td>
      <td>
        <select
          id="work-type"
          onChange={handleWorkTypeChange}
          ref={initialFocusRef}
          value={workTypeValue(workType)}
        >
          <option value="">{'\xA0'}</option>
          {workTypeOptions.map((option) => (
            <option key={option.value} value={option.value}>
              {option.text}
            </option>
          ))}
        </select>
      </td>
    </tr>
  );
}

const WorkTypeSelect:
  component(...React.PropsOf<_WorkTypeSelect>) =
  React.memo(_WorkTypeSelect);

export default WorkTypeSelect;
