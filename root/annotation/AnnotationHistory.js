/*
 * @flow strict-local
 * Copyright (C) 2022 MetaBrainz Foundation
 *
 * This file is part of MusicBrainz, the open internet music database,
 * and is licensed under the GPL version 2, or (at your option) any
 * later version: http://www.gnu.org/licenses/gpl-2.0.txt
 */

import ENTITIES from '../../entities.mjs';
import PaginatedResults from '../components/PaginatedResults.js';
import manifest from '../static/manifest.mjs';
import AnnotationHistoryTable
  from '../static/scripts/annotation/AnnotationHistoryTable.js';
import FormSubmit from '../static/scripts/edit/components/FormSubmit.js';
import chooseLayoutComponent from '../utility/chooseLayoutComponent.js';

component AnnotationHistory(
  annotations: $ReadOnlyArray<AnnotationT>,
  entity: AnnotatedEntityT,
  pager: PagerT,
) {
  const entityType = entity.entityType;
  const entityUrlFragment = ENTITIES[entityType].url;
  const baseUrl = `/${entityUrlFragment}/${entity.gid}`;
  const LayoutComponent = chooseLayoutComponent(entityType);
  const canCompare = annotations.length > 1;

  return (
    <LayoutComponent
      entity={entity}
      fullWidth
      page="annotation-history"
      title={l('Annotation history')}
    >
      <h2>{l('Annotation history')}</h2>
      {annotations.length ? (
        <form
          action={`${baseUrl}/annotations-differences`}
        >
          <PaginatedResults pager={pager}>
            <AnnotationHistoryTable
              annotations={annotations}
              baseUrl={baseUrl}
            />
            {canCompare ? (
              <div className="row no-margin">
                <FormSubmit label={l('Compare versions')} />
              </div>
            ) : null}
          </PaginatedResults>
          {manifest('annotation/AnnotationHistoryTable', {async: true})}
        </form>
      ) : (
        <p>
          {l('This entity has no annotation history.')}
        </p>
      )}
    </LayoutComponent>
  );
}

export default AnnotationHistory;
