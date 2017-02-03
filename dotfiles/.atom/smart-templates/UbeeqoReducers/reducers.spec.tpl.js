import { expect } from 'chai';

import { __RENAME_THIS_GENERATED_ACTION } from './actions';

import { subReducer } from './reducers';

describe('<%= Name %>: reducers', () => {
  const initialState = {
    isLoading: null,
  };

  it('Should do nothing on unknown action', () => {
    const state = {};
    expect(subReducer(state, { type: 'unknown' })).to.equal(state);
  });

  it('Should set initial state when empty', () => {
    expect(subReducer()).to.eql(initialState);
  });

  it('Should set isLoading to true when asked', () => {
    expect(subReducer(initialState, {
      type: __RENAME_THIS_GENERATED_ACTION,
    })).to.have.property('isLoading', true);
  });
});
