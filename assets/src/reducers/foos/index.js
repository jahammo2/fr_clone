import Immutable from 'immutable';

import actionTypes from 'src/constants/actionTypes';
import INITIAL_STATE from './initialState';

export default function (state = INITIAL_STATE, { payload, type }) {
  switch (type) {
    case actionTypes.FOO__FIND_FAILURE:
      return state.withMutations(map => {
        map.set('errors', null);
        map.set('isActive', false);
      });

    case actionTypes.FOO__FIND_START:
      return state.set('isActive', true);

    case actionTypes.FOO__FIND_SUCCESS:
      return state.withMutations(map => {
        const { foo } = payload;

        map.set('isActive', false);
        map.setIn(['loaded', 'foos', foo.id], Immutable.fromJS(foo));
      });

    default:
      return state;
  }
}
