import classNames from 'classnames/bind';
import React from 'react';

import * as basePropTypes from 'src/constants/propTypes/base';

import FieldErrors from 'src/components/shared/FieldErrors';

import styles from './styles.module.scss';

const cx = classNames.bind(styles);

function getFieldClassNames({ errorMessages }) {
  return cx({
    Field      : true,
    isErroring : errorMessages,
  });
}

function TextField(props) {
  const {
    disabled,
    errorMessages,
    htmlFor,
    name,
    placeholder,
    type,
  } = props;

  return (
    <label className={ styles.Root } htmlFor={ htmlFor }>
      <input
        className={ getFieldClassNames(props) }
        disabled={ disabled }
        name={ name }
        placeholder={ placeholder }
        type={ type }
      />

      <If condition={ errorMessages }>
        <FieldErrors errorMessages={ errorMessages } />
      </If>
    </label>
  );
}

TextField.propTypes = {
  disabled      : basePropTypes.disabled.isRequired,
  errorMessages : basePropTypes.errorMessages,
  htmlFor       : basePropTypes.htmlFor.isRequired,
  name          : basePropTypes.name.isRequired,
  placeholder   : basePropTypes.placeholder,
  type          : basePropTypes.type.isRequired,
};

export default TextField;
