/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int toUnsigned(int width)
 * Returns the least significant width bits of this integer as a non-negative
 * number (i.e. unsigned representation). The returned value has zeros in all
 * bit positions higher than width.
 * ...
 * If the input fits in width bits without truncation, the result is the same as
 * the input. The minimum width needed to avoid truncation of x is given
 * by x.bitLength, i.e.
 *
 * x == x.toUnsigned(x.bitLength);
 * @description x == x.toUnsigned(x.bitLength);
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

test(int x) {
  Expect.equals(x, x.toUnsigned(x.bitLength));
}

main() {
  test(0);
  test(1);
  test(17);
  test(1024);
  test(123456789);
}
