/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test aims to check for typeMismatch flag with
 * type=datetime-local input fields
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  InputElement i = document.createElement('input') as InputElement;
  i.type = 'datetime-local';

  void check(String value, [bool disabled=false]) {
    i.value = value;
    i.disabled = disabled;

    if (i.validity.typeMismatch)
      testFailed('"' + value + '" had typeMismatch. This should not happen with sanitization.');
  }

  void shouldBeValid(String value) {
    check(value);
    if ((value == '' && i.value == '') || (value != '' && i.value != ""))
      testPassed('"' + value + '" is a correct valid datetime-local string.');
    else
      testFailed('"' + value + '" is a valid datetime-local string that failed to be set on the input.');
  }

  void shouldBeInvalid(String value, [bool disabled=false]) {
    check(value, disabled);
    if (i.value == '')
      testPassed('"' + value + '" is an invalid datetime-local string and was sanitized' + (disabled ? ' while disabled' : '') + '.');
    else
      testFailed('"' + value + '" is an invalid datetime-local string and was not sanitized' + (disabled ? ' while disabled' : '') + '.');
  }

  // Valid values
  shouldBeValid('');
  shouldBeValid('2009-09-07T16:49');
  shouldBeValid('2009-09-07T16:49:31');
  shouldBeValid('2009-09-07T16:49:31.1');
  shouldBeValid('2009-09-07T16:49:31.12');
  shouldBeValid('2009-09-07T16:49:31.123');
  shouldBeValid('2009-09-07T16:49:31.1234567890');
  shouldBeValid('275760-09-13T00:00:00.000');
  shouldBeValid('0001-01-01T00:00:00.000');

  // Invalid values
  shouldBeInvalid(' 2009-09-07T16:49 ');
  shouldBeInvalid('2009-09-07t16:49');
  shouldBeInvalid('2009-09-07 16:49');
  shouldBeInvalid('2009/09/07T16:49');
  shouldBeInvalid('a');
  shouldBeInvalid('-1-09-07T16:49');
  shouldBeInvalid('0000-12-31T23:59:59.999');
  shouldBeInvalid('275760-09-13T00:00:00.001');

  // Disabled
  shouldBeInvalid('invalid', true);
}
