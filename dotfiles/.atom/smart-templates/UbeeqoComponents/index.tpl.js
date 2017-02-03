import { <%= Name %> as <%= Name %>Component } from './component';
import { containerFactory } from './containerFactory';
import { push } from 'react-router-redux';

export const <%= Name %> = containerFactory(<%= Name %>Component, {
  goNext(dispatch) {
    dispatch(push('/route'));
  },
});
