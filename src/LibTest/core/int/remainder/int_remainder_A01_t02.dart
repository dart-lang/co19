/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num remainder(num other)
 * Returns remainder left by division.
 * @description Checks that this method returns correct value for double arguments.
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 * @needsreview Undocumented
 * seems to work the same way as JS's operator%: the sign of remainder is the same as dividend's
 */

main() {
  check(0.0, 1, 0.5);
  check(0.0, 1, -0.5);

  check(0.25, 1, 0.375);
  check(0.25, 1, -0.375);
  check(-0.25, -1, 0.375);
  check(-0.25, -1, -0.375);

  final double MIN_DOUBLE = Math.pow(2.0, -1074);
  final double NEG_MIN_DOUBLE = -1 * MIN_DOUBLE; 
  final double MAX_DOUBLE = (2 - Math.pow(2.0, -52)) * Math.pow(2.0, 1023);
  final double NEG_MAX_DOUBLE = -1 * MAX_DOUBLE; 

  check(0, MIN_DOUBLE, 0);
  check(0, NEG_MIN_DOUBLE, 0);
  check(0, MAX_DOUBLE, 0);
  check(0, NEG_MAX_DOUBLE, 0);
  check(1, 1, MAX_DOUBLE);
  check(1, 1, NEG_MAX_DOUBLE);
  check(1, 1, double.INFINITY);
  check(-1, -1, double.INFINITY);
  check(1, 1, double.NEGATIVE_INFINITY);
  check(-1, -1, double.NEGATIVE_INFINITY);
  check(0x1000000000000000000000, 0x1000000000000000000000, double.INFINITY);
  check(-0x1000000000000000000000, -0x1000000000000000000000, double.INFINITY);
  check(0x1000000000000000000000, 0x1000000000000000000000, double.NEGATIVE_INFINITY);
  check(-0x1000000000000000000000, -0x1000000000000000000000, double.NEGATIVE_INFINITY);
  
  Expect.isTrue((1 % double.NAN).isNAN());
  Expect.isTrue((0x1000000000000000000000 % double.NAN).isNAN());
  Expect.isTrue(((-0x1000000000000000000000) % double.NAN).isNAN());
  Expect.isTrue((1 % 0.0).isNAN());
  Expect.isTrue((1 % -0.0).isNAN());
  Expect.isTrue((0x1000000000000000000000 % 0.0).isNAN());
  Expect.isTrue(((-0x1000000000000000000000) % 0.0).isNAN());
}

void check(num ex, int a, double b) {
  Expect.equals(ex, a % b);
  Expect.isTrue((a % b) is double);
}
