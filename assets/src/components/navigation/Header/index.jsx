import React from 'react';
import { Link } from 'react-router-dom';

import * as basePropTypes from 'src/constants/propTypes/base';

import styles from './styles.module.scss';

function Header(props) {
  const {
  } = props;

  return (
    <div className={ styles.Root }>
      <ul className={ styles.List }>
        <li className={ styles.ListItem }>
          <Link to={ '/costing-requests' }>Costing Requests</Link>
        </li>

        <li className={ styles.ListItem }>
          <Link to={ '/costing-requests/new' }>New Costing Request</Link>
        </li>
      </ul>
    </div>
  );
}

Header.propTypes = {
};

export default Header;
