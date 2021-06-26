import React from 'react';

import * as basePropTypes from 'src/constants/propTypes/base';

import styles from './styles.module.scss';

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
        className={ styles.Button }
        disabled={ disabled }
        onClick={ handleClick }
        type="submit"
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
