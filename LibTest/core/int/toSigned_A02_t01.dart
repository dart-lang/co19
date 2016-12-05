/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int toSigned(int width)
 * ...
 * If the input value fits in width bits without truncation, the result is the
 * same as the input. The minimum width needed to avoid truncation of x is
 * x.bitLength + 1, i.e.
 *
 * x == x.toSigned(x.bitLength + 1);
 * @description Checks that x == x.toSigned(x.bitLength + 1);
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

test(int x) {
  Expect.equals(x, x.toSigned(x.bitLength + 1));
}

main() {
  test(0);
  test(1);
  test(17);
  test(1024);
  test(123456789);
  test(-1);
  test(-17);
  test(-1024);
  test(-123456789);
}
