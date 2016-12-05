/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toRadixString(int radix)
 * ...
 * The radix argument must be an integer in the range 2 to 36.
 * @description Checks that radix argument must be an integer
 * in the range 2 to 36.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  check(0, -1);
  check(0, 0);
  check(0, 1);
  check(0, 37);
  check(0, 0x80000000);
  check(0, -0x80000000);

  check(1, -1);
  check(2, 0);
  check(3, 1);
  check(4, 37);
  check(5, 0x80000000);
  check(6, -0x80000000);
}

void check(int i, int r) {
  Expect.throws(() {i.toRadixString(r);});
}
