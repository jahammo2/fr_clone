import camelCaseData from 'src/services/shared/camelCaseData';
import handleError from 'src/services/shared/handleError';

import apiService from './api';

export default {
  getAll() {
    return apiService
      .get('/costing_requests')
      .then(({ data }) => camelCaseData(data))
      .catch(handleError);
  },
};
