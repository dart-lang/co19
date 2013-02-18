import "../../../Utils/expect.dart";
/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
 /**
 * @assertion String toStringAsExponential([int fractionDigits])
 * If fractionDigits is given then it must be an integer satisfying: 0 <= fractionDigits <= 20.
 * @description Checks that an exception is thrown when [fractionDigit] is null or out of range.
 * @author msyabro
 * @reviewer rodionov
 * @needsreview Exact exception/error not specified, no error on null
 */

main() {
  check(0.0, -1);
  check(0.0, 20);
  check(0.0, -0x8000000000000000);
  check(0.0, 0x8000000000000000);
  check(0.0, null);
}

void check(double x, int digits) {
  bool fail = false;
  try {
    print(x.toStringAsExponential(digits));
    fail = true;
  } catch(e) {}

  Expect.isFalse(fail, "Some exception is expected");
}
