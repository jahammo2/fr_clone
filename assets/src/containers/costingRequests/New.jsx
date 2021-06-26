import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import React, { useCallback, useEffect } from 'react';

import * as basePropTypes from 'src/constants/propTypes/base';
import * as costingRequestsActionCreators from 'src/actions/costingRequests';

import CostingRequestsNew from 'src/components/costingRequests/New';

function FunctionalCostingRequests(props) {
  const handleSubmit = useCallback((values) => {
    console.log('calling handleSubmit', values);
  }, []);

  return (
    <CostingRequestsNew
      handleSubmit={ handleSubmit }
      { ...props }
    />
  );
}

function mapStateToProps({ costingRequests }) {
  return {
  };
}

function mapDispatchToProps(dispatch) {
  return {
    actions : {
      costingRequests : bindActionCreators(costingRequestsActionCreators, dispatch),
    },
  };
}

FunctionalCostingRequests.propTypes = {
  actions : basePropTypes.actions.isRequired,
};

export default connect(mapStateToProps, mapDispatchToProps)(FunctionalCostingRequests);
