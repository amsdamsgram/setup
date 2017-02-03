import { <%= Name %> as <%= Name %>Component } from './component.native';
import { containerFactory } from './containerFactory';
import { push } from '../../../../technical/native-navigation/actions';

export const <%= Name %> = containerFactory(<%= Name %>Component, {
  goNext(dispatch) {
    dispatch(push('not.contected.route'));
  },
});
