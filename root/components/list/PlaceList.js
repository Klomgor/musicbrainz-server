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

component PlaceList(
  checkboxes?: string,
  mergeForm?: MergeFormT,
  order?: string,
  places: $ReadOnlyArray<PlaceT>,
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
      const nameColumn = defineNameColumn<PlaceT>({
        descriptive: false, // since area has its own column
        order,
        sortable,
        title: l('Place'),
      });
      const typeColumn = defineTypeColumn({
        order,
        sortable,
        typeContext: 'place_type',
      });
      const addressColumn = defineTextColumn<PlaceT>({
        columnName: 'address',
        getText: entity => entity.address,
        order,
        sortable,
        title: l('Address'),
      });
      const areaColumn = defineEntityColumn<PlaceT>({
        columnName: 'area',
        getEntity: entity => entity.area,
        title: l('Area'),
      });
      const beginDateColumn = defineBeginDateColumn({});
      const endDateColumn = defineEndDateColumn({});
      const ratingsColumn = defineRatingsColumn<PlaceT>({
        getEntity: entity => entity,
      });

      return [
        ...(checkboxColumn ? [checkboxColumn] : []),
        nameColumn,
        typeColumn,
        addressColumn,
        areaColumn,
        beginDateColumn,
        endDateColumn,
        ...(showRatings ? [ratingsColumn] : []),
        ...(mergeForm && places.length > 2 ? [removeFromMergeColumn] : []),
      ];
    },
    [
      $c.user,
      checkboxes,
      mergeForm,
      order,
      places,
      showRatings,
      sortable,
    ],
  );

  return useTable<PlaceT>({className, columns, data: places});
}

export default PlaceList;
