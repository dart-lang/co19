/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toStringAsExponential([int fractionDigits]) 
 * If fractionDigits is given then it must be an integer satisfying:
 * 0 <= fractionDigits <= 20.
 * @description Tries to pass an argument that is null or out of range, expects
 * an exception.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  check(0, -1);
  check(0, 21);
  check(0, -0x800000000000000);
  check(0, 0x8000000000000000);
  check(1, -1);
  check(2, 21);
  check(3, -0x800000000000000);
  check(4, 0x8000000000000000);
}

void check(int x, int digits) {
  Expect.throws(() {x.toStringAsExponential(digits);});
}
