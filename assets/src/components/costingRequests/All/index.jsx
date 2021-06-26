import React from 'react';

import CostingRequestRow from './CostingRequestRow';
import styles from './styles.module.scss';

function CostingRequestsAll(props) {
  const {
    costingRequests,
  } = props;

  return (
    <div className={ styles.Root }>
      <h3>Costing Requests:</h3>

      <ul>
        <For each="costingRequest" of={ costingRequests }>
          <CostingRequestRow
            costingRequest={ costingRequest }
            key={ costingRequest.get('id') }
          />
        </For>
      </ul>
    </div>
  );
}

export default CostingRequestsAll;
