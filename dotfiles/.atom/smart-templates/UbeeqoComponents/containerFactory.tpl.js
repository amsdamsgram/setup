import { connect } from 'react-redux';
import { getErrorMessage } from '../../../../technical/network/selectors';

function mapStateToProps(state) {
  return {
    errorMessage: getErrorMessage(state),
  };
}

function createMapDispatchToProps({ goNext }) {
  return (dispatch) => ({
    onClick(event) {
      event.preventDefault();
      goNext(dispatch);
    },
  });
}

export function containerFactory(component, { goNext }) {
  return connect(
    mapStateToProps,
    createMapDispatchToProps({ goNext })
  )(component);
}
