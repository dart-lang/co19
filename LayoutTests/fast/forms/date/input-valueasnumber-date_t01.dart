/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for .valueAsNumber with <input type=date>.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  InputElement input = document.createElement('input') as InputElement;
  input.type = 'date';

  num valueAsNumberFor(String stringValue) {
    input.value = stringValue;
    return input.valueAsNumber;
  }

  String setValueAsNumberAndGetValue(int year, int month, int day) {
    DateTime date = new DateTime.utc(year, month, day);
    input.valueAsNumber = date.millisecondsSinceEpoch;
    return input.value;
  }

  shouldBe(valueAsNumberFor(""), NaN);
  shouldBe(valueAsNumberFor("1969-12-31"), new DateTime.utc(1969, 12, 31).millisecondsSinceEpoch);
  shouldBe(valueAsNumberFor("1970-01-01"), new DateTime.utc(1970, 1, 1).millisecondsSinceEpoch);
  shouldBe(valueAsNumberFor("2009-12-22"), new DateTime.utc(2009, 12, 22).millisecondsSinceEpoch);

  shouldBe(setValueAsNumberAndGetValue(1969, 12, 1), "1969-12-01");
  shouldBe(setValueAsNumberAndGetValue(1970, 1, 1), "1970-01-01");
  shouldBe(setValueAsNumberAndGetValue(2009, 12, 31), "2009-12-31");
  shouldBe(setValueAsNumberAndGetValue(10000, 1, 1), "10000-01-01");

  shouldBe(setValueAsNumberAndGetValue(-1, 1, 1), "");
  shouldBe(setValueAsNumberAndGetValue(0, 12, 31), "");
  shouldBe(setValueAsNumberAndGetValue(1, 1, 1), "0001-01-01");
  shouldBe(setValueAsNumberAndGetValue(275760, 9, 13), "275760-09-13");

  debug('Tests to set invalid values to valueAsNumber:');
  input.valueAsNumber = NaN;
  shouldBeNaN(input.valueAsNumber);
  shouldBeEqualToString(input.value, '');

  shouldThrow(() => input.valueAsNumber = double.infinity);
  shouldThrow(() => input.valueAsNumber = double.negativeInfinity);

  /*
  shouldBeNaN('input.valueAsNumber = new DateTime.utc(275760, 9, 14); input.valueAsNumber');
  shouldBeEqualToString('input.valueAsNumber = new DateTime.utc(275760, 9, 14); input.value', '');
  */
  
  shouldThrow(() => new DateTime.utc(275760, 9, 14));
}
