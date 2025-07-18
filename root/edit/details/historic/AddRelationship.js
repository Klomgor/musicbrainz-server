/*
 * @flow strict
 * Copyright (C) 2020 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import {HistoricRelationship}
  from '../../../static/scripts/common/components/Relationship.js';

component AddRelationship(edit: AddRelationshipHistoricEditT) {
  return (
    <table className="details add-relationship-historic">
      <tr>
        <th rowSpan={2}>{addColonText(l('Relationships'))}</th>
        <td>
          <ul>
            {edit.display_data.relationships.map(relationship => (
              <li key={relationship.id}>
                <HistoricRelationship relationship={relationship} />
              </li>
            ))}
          </ul>
        </td>
      </tr>
    </table>
  );
}

export default AddRelationship;
