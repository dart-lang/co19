/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static num pow(num x, num exponent)
 * @description Checks that if [exponent] is 1 the result equals [x].
 * @author msyabro
 * @reviewer pagolubev
 */

#import("dart:math", prefix: "Math");

check(num n) {
  Expect.equals(n, Math.pow(n, 1.0));
}

main() {
  check(1);
  check(-1);
  check(2.0);
  check(1.7976931348623157e308);
  check(4.9406564584124654e-324);
  check(-1.7976931348623157e308);
  check(-4.9406564584124654e-324);
  check(double.INFINITY);
  check(double.NEGATIVE_INFINITY);
}
