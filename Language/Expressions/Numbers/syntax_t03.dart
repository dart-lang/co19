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
 * @description Checks different decimal numeric literals with decimal point
 * but no exponent.
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
  check(-0.0, -0);
  check(1.0, 1);
  check(-2.0, -2);
  check(3.0, 3);
  check(-4.0, -4);
  check(5.0, 5);
  check(-6.0, -6);
  check(7.0, 7);
  check(-8.0,-8);
  check(9.0, 9);
  check(-0.0, -0);
  check(1.1, 1.1);
  check(-2.2, -2.2);
  check(3.3, 3.3);
  check(-4.4, -4.4);
  check(5.5, 5.5);
  check(-6.6, -6.6);
  check(7.7, 7.7);
  check(-8.8, -8.8);
  check(9.9, 9.9);
  check(-.0, -0);
  check(.1, 0.1);
  check(-.2, -0.2);
  check(.3, 0.3);
  check(-.4, -0.4);
  check(.5, 0.5);
  check(-.6, -0.6);
  check(.7, 0.7);
  check(-.8, -0.8);
  check(.9, 0.9);
}
