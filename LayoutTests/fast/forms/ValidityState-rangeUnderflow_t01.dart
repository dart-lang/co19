/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test aims to check for rangeUnderflow flag with input
 * fields
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  InputElement input = document.createElement('input') as InputElement;

  void checkNotUnderflow(String value, String min, bool disabled) {
    input.value = value;
    input.min = min;
    input.disabled = disabled;
    var underflow = input.validity.rangeUnderflow;
    var resultText = 'The value "' + input.value + '" ' +
      (underflow ? 'underflows' : 'doesn\'t underflow') +
      ' the minimum value "' + input.min + '"' + (disabled ? ' when disabled.' : '.');
    if (underflow)
      testFailed(resultText);
    else
      testPassed(resultText);
  }

  // ----------------------------------------------------------------
  debug('Type=text');
  input.type = 'text';  // No underflow for type=text.
  checkNotUnderflow('99', '100', false);
}
