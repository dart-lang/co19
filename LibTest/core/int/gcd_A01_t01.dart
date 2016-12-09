/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int gcd(int other)
 * Returns the greatest common divisor of this integer and other.
 *
 * If either number is non-zero, the result is the numerically greatest integer
 * dividing both this and other.
 *
 * The greatest common divisor is independent of the order, so x.gcd(y) is
 * always the same as y.gcd(x).
 * ...
 * @description Checks that this method returns the greatest common divisor of
 * this integer and other
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(3, 9.gcd(6));
  Expect.equals(17, (17 * 3).gcd(17 * 2));
  Expect.equals(17, (17 * 2).gcd(17 * 3));
  Expect.equals(17, (-17 * 3).gcd(-17 * 2));
  Expect.equals(17, (-17 * 2).gcd(-17 * 3));
  Expect.equals(17, (-17 * 2).gcd(17 * 3));
  Expect.equals(17, 17.gcd(17));
  Expect.equals(17, 17.gcd(-17));
}
