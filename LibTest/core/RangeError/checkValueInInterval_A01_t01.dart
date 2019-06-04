/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void checkValueInInterval(int value, int minValue, int maxValue,
 * [String name, String message])
 * Check that a value lies in a specific interval.
 *
 * Throws if value is not in the interval. The interval is from minValue
 * to maxValue, both inclusive.
 * @description Checks that RangeError is thrown if value not in interval
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(int value, int min, int max) {
  try {
    RangeError.checkValueInInterval(value, min, max);
    Expect.fail("RangeError expected");
  } on RangeError catch (e) {
    Expect.equals(min, e.start);
    Expect.equals(max, e.end);
    Expect.equals(value, e.invalidValue);
    Expect.equals(null, e.name);
    Expect.equals("Invalid value", e.message);
  } catch (e) {
    Expect.fail("Wrong exception type $e");
  }
}

main() {
  check(-1, 2, 5);
  check(6, 2, 5);
  check(-1, -10, -20);
}
