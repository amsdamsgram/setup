import { expect } from 'chai';
import { __RENAME_THIS_STATE_KEY } from './constants';
import { isLoading } from './selectors';

const state = {
  [__RENAME_THIS_STATE_KEY]: {
    isLoading: true,
  },
};

describe('<%= Name %>: selectors ', () => {
  it('Should return null if module state is not defined', () => {
    expect(isLoading({})).to.equal(null);
  });

  it('Should return the module state if it exist', () => {
    expect(isLoading(state)).to.eql(state[__RENAME_THIS_STATE_KEY].isLoading);
  });
});
