/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion RangeError.range(num invalidValue, int minValue, int maxValue,
 *    [String name, String message])
 * Create a new RangeError with for an invalid value being outside a range.
 *
 * The allowed range is from minValue to maxValue, inclusive.
 * If minValue or maxValue are null, the range is infinite in that direction.
 * @description Checks that this constructor creates RangeError for an invalid
 * value being outside a range.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(num invalidValue, int minValue, int maxValue) {
  RangeError re = new RangeError.range(invalidValue, minValue, maxValue);
  Expect.equals(minValue, re.start);
  Expect.equals(maxValue, re.end);
  Expect.equals(invalidValue, re.invalidValue);
}

main() {
  check(-1, 1, 5);
  check(14, -1, 5);
  check(1, 1, 5);
  check(15, null, 5);
  check(-1, null, 5);
  check(-1, 1, null);
  check(17, 1, null);
  check(3.14, 1, 5);
  check(-1, null, null);
}
