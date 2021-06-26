import React from 'react';

import styles from './styles.module.scss';

function CostingRequestRow(props) {
  const {
    costingRequest,
  } = props;

  return (
    <li className={ styles.Root }>
      <div className={ styles.Value }>{ costingRequest.get('id') }</div>
      <div className={ styles.Value }>{ costingRequest.get('opportunityId') }</div>
    </li>
  );
}

export default CostingRequestRow;
