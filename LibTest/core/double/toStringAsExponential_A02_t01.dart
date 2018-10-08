/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
 /**
 * @assertion String toStringAsExponential([int fractionDigits])
 * If fractionDigits is given then it must be an integer satisfying: 0 <= fractionDigits <= 20.
 * @description Checks that an exception is thrown when [fractionDigit] is out of range.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  check(0.0, -1);
  check(0.0, 21);
  check(0.0, -0x800000000000000);
  check(0.0, 0x8000000000000000);
}

void check(double x, int digits) {
  Expect.throws(() {x.toStringAsExponential(digits);});
}
