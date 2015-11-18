/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A numeric literal is either a decimal or hexadecimal integer of
 * arbitrary size, or a decimal double.
 *
 * numericLiteral:
 *   NUMBER|
 *   HEX_NUMBER
 *;
 * NUMBER:
 *   DIGIT+ ('.' DIGIT+)? EXPONENT? |
 *  '.' DIGIT+ EXPONENT?
 * ;
 * EXPONENT:
 *   ('e' | 'E') ('+' | '-')? DIGIT+
 * ;
 * HEX NUMBER:
 *   '0x' HEX DIGIT+ |
 *   '0X' HEX DIGIT+
 * ;
 * HEX DIGIT:
 *   'a'..'f' |
 *   'A'..'F' |
 *   DIGIT
 * ;
 * @description Checks different decimal numeric literals with exponent but no
 * decimal point.
 * @author hlodvig
 * @reviewer iefremov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

void check(i, expected) {
  Expect.isTrue(i is num);
  Expect.isTrue(expected is num);
  Expect.equals(expected, i);
}

main() {
  check(-0e1, -0);
  check(1e1, 10);
  check(-2e1, -20);
  check(3e1, 30);
  check(-4e1, -40);
  check(5e1, 50);
  check(-6e1, -60);
  check(7e1, 70);
  check(-8e1, -80);
  check(9e1, 90);
  check(-10e1, -100);
  check(0e-1, 0);
  check(-1e-1, -0.1);
  check(2e-1, 0.2);
  check(-3e-1, -0.3);
  check(4e-1, 0.4);
  check(-5e-1, -0.5);
  check(6e-1, 0.6);
  check(-7e-1, -0.7);
  check(8e-1, 0.8);
  check(-10e-1, -1);
  check(0E1, 0);
  check(-1E1, -10);
  check(2E1, 20);
  check(-3E1, -30);
  check(4E1, 40);
  check(-5E1, -50);
  check(6E1, 60);
  check(-7E1, -70);
  check(8E1, 80);
  check(-9E1, -90);
  check(10E1, 100);
  check(-0E-1, -0);
  check(1E-1, 0.1);
  check(-2E-1, -0.2);
  check(3E-1, 0.3);
  check(-4E-1, -0.4);
  check(5E-1, 0.5);
  check(-6E-1, -0.6);
  check(7E-1, 0.7);
  check(-8E-1, -0.8);
  check(9E-1, 0.9);
  check(-10E-1, -1);
}
