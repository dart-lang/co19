/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion By default Dart is precise and works with rationals.
 * This is the reason 19.99 is read as rational and not as floating-point number.
 * @description Checks that decimals are read as rationals.
 * @author pagolubev
 * @reviewer iefremov
 * @needsreview Are rationals still supported? 
 * scientific notation?
 */


void main() {
  Expect.isTrue(-0. is Rational);
  Expect.isTrue(0.00 is Rational);
  Expect.isTrue(0 is Rational);
  Expect.isTrue(1. is Rational);
  Expect.isTrue(0.1 is Rational);
  Expect.isTrue(-0.1 is Rational);
  Expect.isTrue(9.99 is Rational);
  Expect.isTrue(-13.99 is Rational);
  Expect.isTrue(7 is Rational);
  Expect.isTrue(-2 is Rational);
  Expect.isTrue(2147483647 is Rational);
  Expect.isTrue(-2147483648 is Rational);

  Expect.isTrue(+9223372036854775807 is Rational);
  Expect.isTrue(-9223372036854775808 is Rational);
}
