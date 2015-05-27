/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test aims to check for rangeUnderflow flag with date input
 * fields
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";

main() {
  var input = document.createElement('input');

  checkUnderflow(value, min, [disabled=false]) {
    input.value = value;
    input.min = min;
    input.disabled = disabled;
    var underflow = input.validity.rangeUnderflow;
    var resultText = 'The value "' + input.value + '" ' +
      (underflow ? 'undeflows' : 'doesn\'t underflow') +
      ' the minimum value "' + input.min + '"' + (disabled ? ' when disabled.' : '.');
    if (underflow)
      testPassed(resultText);
    else
      testFailed(resultText);
  }

  checkNotUnderflow(value, min, [disabled=false, sanitized=false]) {
    input.value = value;
    input.min = min;
    input.disabled = disabled;
    var underflow = input.validity.rangeUnderflow;
    var resultText = 'The value "' + input.value + '" ' +
      (sanitized ? 'sanitized from "' + value + '" ' : '') +
      (underflow ? 'underflows' : 'doesn\'t underflow') +
      ' the minimum value "' + input.min + '"' + (disabled ? ' when disabled.' : '.');
    if (underflow)
      testFailed(resultText);
    else
      testPassed(resultText);
  }

  checkSanitizedValueNotUnderflow(value, max, [disabled=false]) {
    // For date types, invalid values are sanitized to "".
    checkNotUnderflow(value, max, disabled, true);
  }

  input.type = 'date';
  input.max = '';
  // No underflow cases
  //checkNotUnderflow('2010-01-27', null);
  checkNotUnderflow('2010-01-27', '');
  checkNotUnderflow('2010-01-27', 'foo');
  // 1000-01-01 is smaller than the implicit minimum value.
  // But the date parser rejects it before comparing the minimum value.
  checkNotUnderflow('1000-01-01', '');
  checkNotUnderflow('1582-10-15', '');
  checkNotUnderflow('2010-01-27', '2010-01-26');
  checkNotUnderflow('2010-01-27', '2009-01-28');
  checkSanitizedValueNotUnderflow('foo', '2011-01-26');

  // Underflow cases
  checkUnderflow('2010-01-27', '2010-01-28');
  checkUnderflow('9999-01-01', '10000-12-31');
  input.max = '2010-01-01';  // value < min && value > max
  checkUnderflow('2010-01-27', '2010-02-01');

  // Disabled
  checkNotUnderflow('9999-01-01', '10000-12-31', true);
}
