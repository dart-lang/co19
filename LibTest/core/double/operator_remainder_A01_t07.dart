/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator %(num other)
 * @description Checks on values that is neither an infinity, nor a zero, nor
 * a NaN
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  //[other] is lesser than [:this:]
  Expect.equals(0.19999999999999996,    1.3 % 1.1);
  Expect.equals(3.0234423888515728E-15, 100.01 % 0.00000001);
  Expect.equals(1.0,                    12.99999999 % 11.99999999);
  Expect.equals(0.012345677999999999,   0.123456789 % 0.111111111);
  Expect.equals(0.22222222219999999,    .7777777777 % .5555555555);
  Expect.equals(0.02000000000000013,    1.1 % 0.12);
  Expect.equals(0.010000000000000009,   0.5 % 0.49);
  Expect.equals(5000000.0,              1.25E13 % 7.5E6);
  Expect.equals(1.0399999999999871E-7,  3.456E-5 % 1.46E-7);
  Expect.equals(0.9999599999999997,     5.0 % 1.00001);
  Expect.equals(0.25000066674215615,    2.74E10 % 7.3E-1);

  //[other] is greater than [:this:]
  Expect.equals(0.1,        0.1 % 0.2);
  Expect.equals(1.12E-10,   1.12E-10 % 1.13E-10);
  Expect.equals(.7654321,   .7654321 % 1.23E10);
  Expect.equals(5.0,        5.0 % 6.0);
  Expect.equals(0.25e-10,   0.25e-10 % 1.0);

  //[:this:] is multiple of [other]
  Expect.equals(0, 5.0 % 1.0);
  Expect.equals(0, 0.4 % 0.2);
  Expect.equals(0, 2.5e-7 % 1.25e-7);
}
