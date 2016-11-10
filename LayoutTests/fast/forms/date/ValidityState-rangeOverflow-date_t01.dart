/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test aims to check for rangeOverflow flag with date input
 * fields
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  InputElement input = document.createElement('input') as InputElement;

  void checkOverflow(String value, String max, [bool disabled=false]) {
    input.value = value;
    input.max = max;
    input.disabled = disabled;
    bool overflow = input.validity.rangeOverflow;
    String resultText = 'The value "${input.value}" ' +
      (overflow ? 'overflows' : 'doesn\'t overflow') +
      ' the maximum value "${input.max}"' + (disabled ? ' when disabled.' : '.');
    if (overflow)
      testPassed(resultText);
    else
      testFailed(resultText);
  }

  void checkNotOverflow(String value, String max, [bool disabled=false, bool sanitized=false]) {
    input.value = value;
    input.max = max;
    input.disabled = disabled;
    bool overflow = input.validity.rangeOverflow;
    String resultText = 'The value "${input.value}" ' +
      (sanitized ? 'sanitized from "${value}" ' : '') +
      (overflow ? 'overflows' : 'doesn\'t overflow') +
      ' the maximum value "${input.max}"' + (disabled ? ' when disabled.' : '.');
    if (overflow)
      testFailed(resultText);
    else
      testPassed(resultText);
  }

  void checkSanitizedValueNotOverflow(String value, String max, [bool disabled=false]) {
    // For date types, invalid values are sanitized to "".
    checkNotOverflow(value, max, disabled, true);
  }

  input.type = 'date';
  input.min = '';
  // No overflow cases
  //checkNotOverflow('2010-01-27', null);
  checkNotOverflow('2010-01-27', '');
  checkNotOverflow('2010-01-27', 'foo');
  checkNotOverflow('2010-01-27', '2010-01-27');
  checkNotOverflow('2010-01-27', '2010-01-28');
  checkNotOverflow('2010-01-27', '2011-01-26');
  checkSanitizedValueNotOverflow('foo', '2011-01-26');
  checkNotOverflow('2010-01-27', '0000-01-01'); // Too small max value.

  // Overflow cases
  checkOverflow('2010-01-27', '2010-01-26');
  checkOverflow('9999-01-01', '2010-12-31');
  input.min = '2010-01-28';  // value < min && value > max
  checkOverflow('2010-01-27', '2010-01-26');

  // Disabled
  checkNotOverflow('9999-01-01', '2010-12-31', true);
}
