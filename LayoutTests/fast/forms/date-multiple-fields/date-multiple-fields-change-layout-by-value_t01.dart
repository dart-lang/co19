/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Change multiple fields date input UI layout by value
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";

main() {
  var testInput = document.createElement('input');
  testInput.type = 'date';
  testInput.max = '9999-12-31';
  document.body.append(testInput);
  var widthOfEmptyValue = testInput.offsetWidth;

  testInput.value = '10000-01-01';
  var widthOfOverflowValue = testInput.offsetWidth;
  shouldBeTrue(widthOfEmptyValue < widthOfOverflowValue);

  testInput.value = '2012-10-05';
  var widthOfValidValue = testInput.offsetWidth;
  shouldBe(widthOfEmptyValue, widthOfValidValue);

  testInput.remove();
}
