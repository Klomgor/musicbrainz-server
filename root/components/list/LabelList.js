/*
 * @flow strict
 * Copyright (C) 2019 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import * as React from 'react';

import {CatalystContext} from '../../context.mjs';
import useTable from '../../hooks/useTable.js';
import formatLabelCode from '../../utility/formatLabelCode.js';
import {
  defineBeginDateColumn,
  defineCheckboxColumn,
  defineEndDateColumn,
  defineEntityColumn,
  defineNameColumn,
  defineRatingsColumn,
  defineTextColumn,
  defineTypeColumn,
  removeFromMergeColumn,
} from '../../utility/tableColumns.js';

component LabelList(
  checkboxes?: string,
  labels: $ReadOnlyArray<LabelT>,
  mergeForm?: MergeFormT,
  order?: string,
  showRatings: boolean = false,
  sortable?: boolean,
) {
  const $c = React.useContext(CatalystContext);

  const className = checkboxes === 'add-to-merge' ? 'mergeable-table' : '';

  const columns = React.useMemo(
    () => {
      const checkboxColumn = $c.user && (nonEmpty(checkboxes) || mergeForm)
        ? defineCheckboxColumn({mergeForm, name: checkboxes})
        : null;
      const nameColumn = defineNameColumn<LabelT>({
        order,
        sortable,
        title: l('Label'),
      });
      const typeColumn = defineTypeColumn({
        order,
        sortable,
        typeContext: 'label_type',
      });
      const labelCodeColumn = defineTextColumn<LabelT>({
        columnName: 'label_code',
        getText: entity => entity.label_code
          ? formatLabelCode(entity.label_code)
          : '',
        order,
        sortable,
        title: l('Code'),
      });
      const areaColumn = defineEntityColumn<LabelT>({
        columnName: 'area',
        getEntity: entity => entity.area,
        order,
        sortable,
        title: l('Area'),
      });
      const beginDateColumn = defineBeginDateColumn({
        order,
        sortable,
      });
      const endDateColumn = defineEndDateColumn({
        order,
        sortable,
      });
      const ratingsColumn = defineRatingsColumn<LabelT>({
        getEntity: entity => entity,
      });

      return [
        ...(checkboxColumn ? [checkboxColumn] : []),
        nameColumn,
        typeColumn,
        labelCodeColumn,
        areaColumn,
        beginDateColumn,
        endDateColumn,
        ...(showRatings ? [ratingsColumn] : []),
        ...(mergeForm && labels.length > 2 ? [removeFromMergeColumn] : []),
      ];
    },
    [
      $c.user,
      checkboxes,
      labels,
      mergeForm,
      order,
      showRatings,
      sortable,
    ],
  );

  return useTable<LabelT>({className, columns, data: labels});
}

export default LabelList;
