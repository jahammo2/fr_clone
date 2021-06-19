import React from 'react';

import styles from './styles.module.scss';

function CostingRequestRow(props) {
  const {
    costingRequest,
  } = props;

  return (
    <li className={ styles.Root }>
      <div>{ costingRequest.get('id') }</div>
      <div>{ costingRequest.get('opportunityId') }</div>
    </li>
  );
}

export default CostingRequestRow;
