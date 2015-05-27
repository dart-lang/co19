/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test aims to check for rangeOverflow flag with input
 * fields
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var input = document.createElement('input');

  checkNotOverflow(value, max, disabled) {
    input.value = value;
    input.max = max;
    input.disabled = disabled;
    var overflow = input.validity.rangeOverflow;
    var resultText = 'The value "' + input.value + '" ' +
      (overflow ? 'overflows' : 'doesn\'t overflow') +
      ' the maximum value "' + input.max + '"' + (disabled ? ' when disabled.' : '.');
    if (overflow)
      testFailed(resultText);
    else
      testPassed(resultText);
  }

  // ----------------------------------------------------------------
  debug('Type=text');
  input.type = 'text';  // No overflow for type=text.
  checkNotOverflow('101', '100', false);
}
