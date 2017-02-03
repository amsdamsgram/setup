import { selectProperty } from '../../technical/redux-helpers/selectors';
import { __RENAME_THIS_STATE_KEY } from './constants';

/**
 * @function isLoading
 * @param {Object} state
 * @returns {Boolean} isLoading
 */
export const isLoading = selectProperty(
  [__RENAME_THIS_STATE_KEY, 'isLoading']
);
