// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion Rationals are exact numbers. Integers are a subtype of rationals.
 * All arithmetic operations (+, -, etc.) working on two rationals will yield an exact rational.
 * If the result is an integer (i.e. without decimals) then the result-type is int.
 * @description Checks that operations +,-,*,/ performed on rationals yield an exact rational,
 * and if the result is an integer then the result-type is int.
 * @author pagolubev
 * @reviewer akuznecov
 * @needsreview Are rationals still supported
 * Same tests are in 04_2_A06 
 */


void main() {
  Rational x = 7 / 9;
  Rational y = 9;
  var z = x * y;
  Expect.isTrue(z == 7);
  Expect.isTrue(z is int);

  x = 0.33;
  y = 3.0;
  z = x*y;
  Expect.isTrue(z == 0.99);
  Expect.isTrue(z is Rational);

  x = 1;
  y = 1/3;
  z = x / y;
  Expect.isTrue(z == 3);
  Expect.isTrue(z is int);

  x = -0.003;
  y = 2;
  z = x / y;
  Expect.isTrue(z == -0.0015);
  Expect.isTrue(z is Rational);

  x = 1/3;
  y = 2/3;
  z = x + y;
  Expect.isTrue(z == 1);
  Expect.isTrue(z is int);

  x = 1.27;
  y = -0.27;
  z = x + y;    
  Expect.isTrue(z == 1);
  Expect.isTrue(z is int);

  x = 4/3;
  y = 1/3;
  z = x - y;
  Expect.isTrue(z == 1);
  Expect.isTrue(z is int);

  x = 2147483647;
  y = 1;
  z = x + y;
  Expect.isTrue(z == 2147483648);
  Expect.isTrue(z > 0);
  Expect.isTrue(z is int);

  x = -2147483648;
  y = 1;
  z = x - y;
  Expect.isTrue(z == -2147483649);
  Expect.isTrue(z < 0);
  Expect.isTrue(z is int);

  x = 9223372036854775807;
  y = 100;
  z = x + y;
  Expect.isTrue(z == 9223372036854775907);
  Expect.isTrue(z > 0);
  Expect.isTrue(z is int);

  x = -9223372036854775808;
  y = 1;
  z = x - y;
  Expect.isTrue(z == -9223372036854775809);
  Expect.isTrue(z < 0);
  Expect.isTrue(z is int);

  x = 9223372036854775808;
  y = 10;
  z = x*y;
  Expect.isTrue(z == 92233720368547758080);

  x = -9223372036854775809;
  y = 2;
  z = x / y;
  Expect.isTrue(z == -4611686018427387904.5);
}
