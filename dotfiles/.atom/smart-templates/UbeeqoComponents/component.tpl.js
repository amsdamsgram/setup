import React, { PropTypes } from 'react';
import styles from './style.scss';

import { translate } from '../../../../technical/i18n/i18n';
import { PageTitle } from '../../../../technical/layout/components/page-title/component';

export function Translatable<%= Name %>({ t, onClick }) {
  return (
    <div className={styles.<%= Name %>}>
      <PageTitle title="<%= Name %>" />
      <a href="#" onClick={onClick}>{t('<%= Name %>')}{" Next"}</a>
    </div>
  );
}

Translatable<%= Name %>.propTypes = {
  t: PropTypes.func.isRequired,
  onClick: PropTypes.func.isRequired,
};

export const <%= Name %> = translate(Translatable<%= Name %>);
