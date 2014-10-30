/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Change multiple fields datetime-local input UI layout by value
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";

main() {
  var testInput = document.createElement('input');
  testInput.type = 'datetime-local';
  testInput.max = '9999-12-31T23:59';
  document.body.append(testInput);
  var widthOfEmptyValue = testInput.offsetWidth;

  testInput.value = '10000-01-01T00:00';
  var widthOfOverflowValue = testInput.offsetWidth;
  shouldBeTrue(widthOfEmptyValue < widthOfOverflowValue);

  testInput.value = '2012-10-05T12:00';
  var widthOfValidValue = testInput.offsetWidth;
  shouldBe(widthOfEmptyValue, widthOfValidValue);

  testInput.value = '2012-10-05T12:00:01';
  var widthWithSecond = testInput.offsetWidth;
  shouldBeTrue(widthOfEmptyValue < widthWithSecond);

  testInput.value = '2012-10-05T12:00:01.234';
  var widthWithMillisecond = testInput.offsetWidth;
  shouldBeTrue(widthWithSecond < widthWithMillisecond);

  testInput.remove();
}
