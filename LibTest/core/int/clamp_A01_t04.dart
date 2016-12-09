  /*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num clamp(num lowerLimit, num upperLimit)
 * Returns this num clamped to be in the range lowerLimit-upperLimit.
 * The comparison is done using compareTo and therefore takes -0.0 into account.
 * This also implies that double.NAN is treated as the maximal double value.
 * @description Checks that returns num clamped to be in the range
 * lowerLimit-upperLimit, where one of the limits is double.NAN
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(num expected, num lowerLimit, num upperLimit, num value) {
  Expect.equals(expected, value.clamp(lowerLimit, upperLimit));
}

main() {
  check(double.MAX_FINITE, 0, double.NAN, double.MAX_FINITE);
  check(double.NAN, 0, double.NAN, double.NAN);
  check(double.INFINITY, 0, double.NAN, double.INFINITY);
  check(double.NAN, 0, double.NAN, double.NAN);

  check(-double.MAX_FINITE, double.NEGATIVE_INFINITY, 0, -double.MAX_FINITE);
  check(-double.MAX_FINITE, -double.MAX_FINITE, 0, double.NEGATIVE_INFINITY);
}
