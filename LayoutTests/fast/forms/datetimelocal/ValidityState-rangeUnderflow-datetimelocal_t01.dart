/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test aims to check for rangeUnderflow flag with
 * datetime-local input fields
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  InputElement input = document.createElement('input') as InputElement;

  void checkUnderflow(String value, String min, [bool disabled=false]) {
    input.value = value;
    input.min = min;
    input.disabled = disabled;
    bool underflow = input.validity.rangeUnderflow;
    String resultText = 'The value "' + input.value + '" ' +
      (underflow ? 'undeflows' : 'doesn\'t underflow') +
      ' the minimum value "' + input.min + '"' + (disabled ? ' when disabled.' : '.');
    if (underflow)
      testPassed(resultText);
    else
      testFailed(resultText);
  }

  void checkNotUnderflow(String value, String min, [bool disabled=false, bool sanitized=false]) {
    input.value = value;
    input.min = min;
    input.disabled = disabled;
    bool underflow = input.validity.rangeUnderflow;
    String resultText = 'The value "' + input.value + '" ' +
      (sanitized ? 'sanitized from "' + value + '" ' : '') +
      (underflow ? 'underflows' : 'doesn\'t underflow') +
      ' the minimum value "' + input.min + '"' + (disabled ? ' when disabled.' : '.');
    if (underflow)
      testFailed(resultText);
    else
      testPassed(resultText);
  }

  void checkSanitizedValueNotUnderflow(String value, String max, [bool disabled=false]) {
    // For date types, invalid values are sanitized to "".
    checkNotUnderflow(value, max, disabled, true);
  }

  input.type = 'datetime-local';
  input.max = '';
  // No underflow cases
  //checkNotUnderflow('2010-01-27T12:34', null);
  checkNotUnderflow('2010-01-27T12:34', '');
  checkNotUnderflow('2010-01-27T12:34', 'foo');
  // 1000-01-01 is smaller than the implicit minimum value.
  // But the date parser rejects it before comparing the minimum value.
  checkNotUnderflow('1000-01-01T12:34', '');
  checkNotUnderflow('1582-10-15T00:00', '');
  checkNotUnderflow('2010-01-27T12:34', '2010-01-26T00:00');
  checkNotUnderflow('2010-01-27T12:34', '2009-01-28T00:00');
  checkSanitizedValueNotUnderflow('foo', '2011-01-26T00:00');

  // Underflow cases
  checkUnderflow('2010-01-27T12:34', '2010-01-27T13:00');
  checkUnderflow('9999-01-01T12:00', '10000-12-31T12:00');
  input.max = '2010-01-01T12:00';  // value < min && value > max
  checkUnderflow('2010-01-27T12:00', '2010-02-01T12:00');

  // Disabled
  checkNotUnderflow('9999-01-01T12:00', '10000-12-31T12:00', true);
}
