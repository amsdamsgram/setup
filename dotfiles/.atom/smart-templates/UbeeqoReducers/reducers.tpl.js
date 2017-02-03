import { encapsulateReducer } from '../../technical/redux-helpers/reducers';

import { __RENAME_THIS_GENERATED_ACTION } from './actions';
import { __RENAME_THIS_STATE_KEY } from './constants';

const INITIAL_STATE = {
  isLoading: null,
};

export function subReducer(state = INITIAL_STATE, action) {
  if (action && action.type === __RENAME_THIS_GENERATED_ACTION) {
    return Object.assign({}, state, { isLoading: true });
  }

  return state;
}

export const <%= Name %>Reducer = encapsulateReducer(
  subReducer,
  __RENAME_THIS_STATE_KEY,
);
