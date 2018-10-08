/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int ceil()
 * Returns the least integer no smaller than this.
 * @description Checks [:ceil():] on a bunch of adjacent values.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

check(int expected, double argument) {
  Expect.equals(expected, argument.ceil());
  Expect.equals(-expected + 1, (-argument).ceil());
}

main() {
  check(2, 1.0000000000000002);
  check(1, 0.9999999999999999);
  check(2, 1.1);
  check(1, 0.9);
  check(2, 1.4999999999999998);
  check(2, 1.5000000000000002);

  check(3, 2.0000000000000004);
  check(2, 1.9999999999999998);
  check(3, 2.1);
  check(2, 1.9);
  check(3, 2.4999999999999996);
  check(3, 2.5000000000000004);

  check(4, 3.0000000000000004);
  check(3, 2.9999999999999996);
  check(4, 3.1);
  check(3, 2.9);
  check(4, 3.4999999999999996);
  check(4, 3.5000000000000004);

  check(1025, 1024.0000000000002);
  check(1024, 1023.9999999999999);
  check(1025, 1024.1);
  check(1024, 1023.9);
  check(1025, 1024.4999999999998);
  check(1025, 1024.5000000000002);

  check(32768, 32767.002);
  check(32767, 32766.998);
  check(32768, 32767.1);
  check(32767, 32766.9);
  check(32768, 32767.499999999996);
  check(32768, 32767.500000000004);

  check(6031770, 6031769.000000001);
  check(6031769, 6031768.999999999);
  check(6031770, 6031769.1);
  check(6031769, 6031768.9);
  check(6031770, 6031769.499999999);
  check(6031770, 6031769.500000001);

  check(2147483648, 2147483647.0000002);
  check(2147483647, 2147483646.9999998);
  check(2147483648, 2147483647.1);
  check(2147483647, 2147483646.9);
  check(2147483648, 2147483647.4999998);
  check(2147483648, 2147483647.5000002);

  check(4503599627370496, 4503599627370495.5);
}
