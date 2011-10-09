/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Rationals are exact numbers. Integers are a subtype of rationals.
 * All arithmetic operations (+, -, etc.) working on two rationals will yield an exact rational.
 * If the result is an integer (i.e. without decimals) then the result-type is int.
 * @description Checks that integers are read as int and int is a subtype of Rational.
 * @author pagolubev
 * @reviewer akuznecov
 * @needsreview Are rationals still supported?
 */


void checkInt(var x) {
  Expect.isTrue(x is Rational);
  Expect.isTrue(x is int);
}

void checkFraction(var x) {
  Expect.isTrue(x is Rational);
  Expect.isTrue(!(x is int));
}

void main() {
  checkInt(0);
  checkInt(-1);
  checkInt(3);

  checkInt(2147483648);
  Expect.isTrue(2147483648 > 0);

  checkInt(-2147483649);
  Expect.isTrue(-2147483649 <0);

  checkInt(9223372036854775808);
  Expect.isTrue(9223372036854775808 > 0);

  checkInt(-9223372036854775809);
  Expect.isTrue(-9223372036854775809 < 0);

  checkFraction(5/7);
  checkFraction(0.3);
  checkFraction(-3/7);
  checkFraction(-0.001);
  checkFraction(19.999);
  checkFraction(184467440737095516202 / 19446744073709551620);
}
