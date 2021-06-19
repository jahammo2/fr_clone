import actionTypes from 'src/constants/actionTypes';
import costingRequestsService from 'src/services/costingRequests';

export function getAll() { // eslint-disable-line import/prefer-default-export
  return dispatch => {
    dispatch({ type : actionTypes.COSTING_REQUEST__GET_ALL_START });

    return costingRequestsService
      .getAll()
      .then(({ costingRequests }) => {
        dispatch({
          type    : actionTypes.COSTING_REQUEST__GET_ALL_SUCCESS,
          payload : { costingRequests },
        });
      })
      .catch(error => {
        dispatch({
          type    : actionTypes.COSTING_REQUEST__GET_ALL_FAILURE,
          payload : { error },
        });
      });
  };
}
