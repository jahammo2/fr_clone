import classNames from 'classnames/bind';
import React from 'react';

import * as basePropTypes from 'src/constants/propTypes/base';

import styles from './styles.module.scss';

const cx = classNames.bind(styles);

function getButtonClassNames({ floatRight, isSecondary }) {
  return cx({
    Button : true,
    floatRight,
    isSecondary,
  });
}

function ButtonSubmit(props) {
  const {
    disabled,
    handleClick,
    type,
    value,
  } = props;

  return (
    <div className={ styles.Root }>
      <input
        className={ getButtonClassNames(props) }
        disabled={ disabled }
        onClick={ handleClick }
        type={ type }
        value={ value }
      />
    </div>
  );
}

ButtonSubmit.propTypes = {
  disabled    : basePropTypes.disabled,
  floatRight  : basePropTypes.floatRight,
  handleClick : basePropTypes.handleClick,
  isSecondary : basePropTypes.isSecondary,
  type        : basePropTypes.type.isRequired,
  value       : basePropTypes.value.isRequired,
};

export default ButtonSubmit;
