import handleError from 'src/services/shared/handleError';

import apiService from './api';

export default {
  getAll(id) {
    const params = { id };

    console.log('getting');

    return apiService
      .get('/costing_requests', params)
      .then((foo) => {
        console.log('response', foo);
        return foo.data.data;
      })
      .catch(handleError);
  },
};
