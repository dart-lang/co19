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

main() {
  InputElement testInput = document.createElement('input') as InputElement;
  testInput.type = 'datetime-local';
  testInput.max = '9999-12-31T23:59';
  document.body.append(testInput);
  int widthOfEmptyValue = testInput.offsetWidth;

  testInput.value = '10000-01-01T00:00';
  int widthOfOverflowValue = testInput.offsetWidth;
  shouldBeTrue(widthOfEmptyValue < widthOfOverflowValue);

  testInput.value = '2012-10-05T12:00';
  int widthOfValidValue = testInput.offsetWidth;
  shouldBe(widthOfEmptyValue, widthOfValidValue);

  testInput.value = '2012-10-05T12:00:01';
  int widthWithSecond = testInput.offsetWidth;
  shouldBeTrue(widthOfEmptyValue < widthWithSecond);

  testInput.value = '2012-10-05T12:00:01.234';
  int widthWithMillisecond = testInput.offsetWidth;
  shouldBeTrue(widthWithSecond < widthWithMillisecond);

  testInput.remove();
}
