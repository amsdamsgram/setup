import React, { PropTypes } from 'react';
import { StyleSheet, View, TouchableOpacity, Text } from 'react-native';

import { translate } from '../../../../technical/i18n/i18n.native';
import { PageTitle } from '../../../../technical/layout/components/page-title/component.native';

const styles = StyleSheet.create({
  root: {
    flex: 1,
  },
});

export function Translatable<%= Name %>({ t, onClick }) {
  return (
    <View style={styles.root}>
      <PageTitle title="<%= Name %>" />
      <TouchableOpacity onPress={onClick}>
        <Text>{t('<%= Name %>')}{" Next"}</Text>
      </TouchableOpacity>
    </View>
  );
}
Translatable<%= Name %>.propTypes = {
  t: PropTypes.func.isRequired,
  onClick: PropTypes.func.isRequired,
};

export const <%= Name %> = translate(Translatable<%= Name %>);
