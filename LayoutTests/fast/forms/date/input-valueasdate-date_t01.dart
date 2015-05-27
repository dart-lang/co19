/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for .valueAsDate with <input type=date>.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";

main() {
  var input = document.createElement('input');
  input.type = 'date';

  valueAsDateFor(stringValue) {
    input.value = stringValue;
    return input.valueAsDate;
  }

  setValueAsDateAndGetValue(year, month, day) {
    var date = new DateTime.utc(year, month, day);
    input.valueAsDate = date;
    return input.value;
  }

  shouldBe(valueAsDateFor(""), null);
  shouldBe(valueAsDateFor("1969-12-31").millisecondsSinceEpoch, new DateTime.utc(1969, 12, 31).millisecondsSinceEpoch);
  shouldBe(valueAsDateFor("1970-01-01").millisecondsSinceEpoch, new DateTime.utc(1970, 1, 1).millisecondsSinceEpoch);
  shouldBe(valueAsDateFor("2009-12-22").millisecondsSinceEpoch, new DateTime.utc(2009, 12, 22).millisecondsSinceEpoch);

  shouldBeEqualToString(setValueAsDateAndGetValue(1969, 12, 1), '1969-12-01');
  shouldBeEqualToString(setValueAsDateAndGetValue(1970, 1, 1), '1970-01-01');
  shouldBeEqualToString(setValueAsDateAndGetValue(2009, 12, 31), '2009-12-31');
  shouldBeEqualToString(setValueAsDateAndGetValue(10000, 1, 1), '10000-01-01');

  shouldBeEqualToString(setValueAsDateAndGetValue(-1, 1, 1), '');
  shouldBeEqualToString(setValueAsDateAndGetValue(0, 12, 31), '');
  shouldBeEqualToString(setValueAsDateAndGetValue(1, 1, 1), '0001-01-01');
  shouldBeEqualToString(setValueAsDateAndGetValue(1582, 10, 15), '1582-10-15');
  shouldBeEqualToString(setValueAsDateAndGetValue(1582, 10, 31), '1582-10-31');
  shouldBeEqualToString(setValueAsDateAndGetValue(275760, 9, 13), '275760-09-13');
  //shouldBeEqualToString(setValueAsDateAndGetValue(275760, 9, 14), ''); // Date of JavaScript can't represent this.
  shouldThrow(() => setValueAsDateAndGetValue(275760, 9, 14));
}
