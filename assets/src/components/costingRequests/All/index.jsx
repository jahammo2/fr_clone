import React from 'react';

import CostingRequestRow from './CostingRequestRow';
import styles from './styles.module.scss';

function Dashboard(props) {
  const {
    costingRequests,
  } = props;

  return (
    <div className={ styles.Root }>
      <h3>Costing Requests:</h3>
      <For each="costingRequest" of={ costingRequests }>
        <CostingRequestRow
          costingRequest={ costingRequest }
          key={ costingRequest.get('id') }
        />
      </For>
    </div>
  );
}

export default Dashboard;
