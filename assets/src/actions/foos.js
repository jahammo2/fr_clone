import actionTypes from 'src/constants/actionTypes';
import foosService from 'src/services/foos';

export function find(id) { // eslint-disable-line import/prefer-default-export
  console.log('maybe?', actionTypes);
  return dispatch => {
    dispatch({ type : actionTypes.FOO__FIND_START });

    return foosService
      .getAll()
      .then(({ foo }) => {
        dispatch({
          type    : actionTypes.FOO__FIND_SUCCESS,
          payload : { foo },
        });
      })
      .catch(error => {
        dispatch({
          type    : actionTypes.FOO__FIND_FAILURE,
          payload : { error },
        });
      });
  };
}
