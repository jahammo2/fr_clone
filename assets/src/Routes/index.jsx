import React from 'react';
import { Route, Switch } from 'react-router-dom';

import CostingRequests from 'src/containers/costingRequests/All';

function Routes(props) {
  /* eslint-disable max-len */
  return (
    <Switch>
      <Route component={ CostingRequests } exact path={ ['/', '/costing-requests'] } />
    </Switch>
  );
  /* eslint-enable max-len */
}

export default Routes;
