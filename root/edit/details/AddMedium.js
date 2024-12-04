/*
 * @flow strict
 * Copyright (C) 2020 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import MediumTracklist
  from '../../medium/MediumTracklist.js';
import DescriptiveLink
  from '../../static/scripts/common/components/DescriptiveLink.js';
import ExpandedArtistCredit
  from '../../static/scripts/common/components/ExpandedArtistCredit.js';
import {artistCreditsAreEqual}
  from '../../static/scripts/common/immutable-entities.js';
import loopParity from '../../utility/loopParity.js';

component CondensedTrackACsRow(
  artistCredit: ArtistCreditT,
  endNumber?: string,
  rowCounter: number,
  startNumber: string,
) {
  return (
    <tr className={loopParity(rowCounter)}>
      <td className="pos t">
        {nonEmpty(endNumber) && endNumber !== startNumber
          ? startNumber + '-' + endNumber
          : startNumber}
      </td>
      <td>
        <ExpandedArtistCredit artistCredit={artistCredit} />
      </td>
    </tr>
  );
}

component CondensedTrackACs(tracks?: $ReadOnlyArray<TrackT>) {
  if (!tracks) {
    return [];
  }

  let thisCredit;
  let thisPosition = tracks[0].position - 1;
  let rowCounter = 0;
  let startNumber = tracks[0].number;
  let endNumber;
  const rows = [];

  tracks.forEach((track, index, array) => {
    const isLast = array.length - 1 === index;
    const isNewArtistCredit = thisCredit &&
      !artistCreditsAreEqual(thisCredit, track.artistCredit);
    const isTherePositionGap = thisPosition + 1 !== Number(track.position);
    if (isNewArtistCredit || isTherePositionGap) {
      rows.push(
        <CondensedTrackACsRow
          artistCredit={thisCredit}
          endNumber={endNumber}
          rowCounter={rowCounter}
          startNumber={startNumber}
        />,
      );
      rowCounter++;
      startNumber = track.number;
      endNumber = startNumber;
    } else {
      endNumber = track.number;
    }
    thisCredit = track.artistCredit;
    thisPosition = Number(track.position);
    if (isLast) {
      rows.push(
        <CondensedTrackACsRow
          artistCredit={thisCredit}
          endNumber={endNumber}
          rowCounter={rowCounter}
          startNumber={startNumber}
        />,
      );
    }
  });
  return rows;
}

component AddMedium(allowNew?: boolean, edit: AddMediumEditT) {
  const display = edit.display_data;
  const format = display.format;

  return (
    <table className="details add-medium">
      {edit.preview /*:: === true */ ? null : (
        <tr>
          <th>{addColonText(l('Release'))}</th>
          <td>
            {display.release
              ? <DescriptiveLink entity={display.release} />
              : null}
          </td>
        </tr>
      )}

      <tr>
        <th>{addColonText(l('Position'))}</th>
        <td>{display.position}</td>
      </tr>

      {nonEmpty(display.name) ? (
        <tr>
          <th>{addColonText(l('Name'))}</th>
          <td>{display.name}</td>
        </tr>
      ) : null}

      {format ? (
        <tr>
          <th>{addColonText(l('Format'))}</th>
          <td>
            {lp_attributes(format.name, 'medium_format')}
          </td>
        </tr>
      ) : null}

      <tr>
        <th>{addColonText(l('Tracklist'))}</th>
        <td>
          <table className="tbl medium">
            <tbody>
              {display.tracks?.length ? (
                <MediumTracklist
                  allowNew={allowNew}
                  showArtists
                  tracks={display.tracks}
                />
              ) : l('The tracklist for this medium is unknown.')}
            </tbody>
          </table>
        </td>
      </tr>

      {display.tracks?.length ? (
        <tr>
          <th>{addColonText(l('Artist credits'))}</th>
          <td>
            <table className="tbl">
              <thead>
                <tr>
                  <th className="pos">{l('#')}</th>
                  <th>{l('Artist')}</th>
                </tr>
              </thead>
              <tbody>
                <CondensedTrackACs tracks={display.tracks} />
              </tbody>
            </table>
          </td>
        </tr>
      ) : null}
    </table>
  );
}

export default AddMedium;
