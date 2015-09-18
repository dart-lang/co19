/*
` * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for .valueAsNumber with <input type=datetime-local>.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";

main() {
  var input = document.createElement('input');
  input.type = 'datetime-local';

  valueAsNumberFor(stringValue) {
    input.value = stringValue;
    return input.valueAsNumber;
  }

  setValueAsNumberAndGetValue(year, month, day, hour, minute, second, msec) {
    var date = new DateTime.utc(year, month, day, hour, minute, second, msec);
    input.valueAsNumber = date.millisecondsSinceEpoch;
    return input.value;
  }

  shouldBe(valueAsNumberFor(""), NaN);
  shouldBe(valueAsNumberFor("1969-12-31T12:34:56.789"), new DateTime.utc(1969, 12, 31, 12, 34, 56, 789).millisecondsSinceEpoch);
  shouldBe(valueAsNumberFor("1970-01-01T00:00:00.000"), new DateTime.utc(1970, 1, 1, 0, 0, 0).millisecondsSinceEpoch);
  shouldBe(valueAsNumberFor("2009-12-22T11:32:11"), new DateTime.utc(2009, 12, 22, 11, 32, 11).millisecondsSinceEpoch);

  shouldBeEqualToString(setValueAsNumberAndGetValue(1969, 12, 1, 0, 0, 0, 0), '1969-12-01T00:00');
  shouldBeEqualToString(setValueAsNumberAndGetValue(1970, 1, 1, 10, 1, 0, 100), '1970-01-01T10:01:00.100');
  shouldBeEqualToString(setValueAsNumberAndGetValue(2009, 12, 31, 23, 59, 59, 999), '2009-12-31T23:59:59.999');
  shouldBeEqualToString(setValueAsNumberAndGetValue(10000, 1, 1, 12, 0, 1, 0), '10000-01-01T12:00:01');

  shouldBeEqualToString(setValueAsNumberAndGetValue(-1, 1, 1, 0, 0, 0, 0), '');
  shouldBeEqualToString(setValueAsNumberAndGetValue(0, 12, 31, 23, 59, 59, 999), '');
  shouldBeEqualToString(setValueAsNumberAndGetValue(1, 1, 1, 0, 0, 0, 0), '0001-01-01T00:00');
  shouldBeEqualToString(setValueAsNumberAndGetValue(275760, 9, 12, 0, 0, 0, 1), '275760-09-12T00:00:00.001');
  shouldBeEqualToString(setValueAsNumberAndGetValue(275760, 9, 13, 0, 0, 0, 0), '275760-09-13T00:00');

  debug('Tests to set invalid values to valueAsNumber:');
  input.valueAsNumber = NaN;
  shouldBeNaN(input.valueAsNumber);
  shouldBeEqualToString(input.value, '');
  shouldThrow(() => input.valueAsNumber = double.INFINITY);
  shouldThrow(() => input.valueAsNumber = double.NEGATIVE_INFINITY);
  /*
  shouldBeNaN('input.valueAsNumber = new DateTime.utc(275760, 9, 13, 0, 0, 0, 1); input.valueAsNumber');
  shouldBeEqualToString('input.valueAsNumber = new DateTime.utc(275760, 9, 13, 0, 0, 0, 1); input.value', '');
  */
  shouldThrow(() => new DateTime.utc(275760, 9, 13, 0, 0, 0, 1));

  debug('Step attribute value and string representation:');
  // If the step attribute value is 1 second and the second part is 0, we should show the second part.
  input.step = "1";
  shouldBe(setValueAsNumberAndGetValue(2010, 1, 21, 0, 0, 0, 0), "2010-01-21T00:00:00");
  // If the step attribute value is 0.001 second and the millisecond part is 0, we should show the millisecond part.
  input.step = "0.001";
  shouldBe(setValueAsNumberAndGetValue(2010, 1, 21, 0, 0, 0, 0), "2010-01-21T00:00:00.000");
}
