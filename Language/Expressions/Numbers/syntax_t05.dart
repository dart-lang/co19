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
 * @description Checks that specifying the exponent value of (+/-)0 is indeed
 * redundant.
 * @author hlodvig
 * @reviewer iefremov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

void check(i, expected) {
  Expect.isTrue(i is num);
  Expect.equals(expected, i);
}

main() {
  check(0e0, 0);
  check(1e+0, 1);
  check(2e-0, 2);
  check(3e0, 3);
  check(4e+0, 4);
  check(5e-0, 5);
  check(6e0, 6);
  check(7e+0, 7);
  check(8e-0, 8);
  check(9e0, 9);
  check(0.0e+0, 0);
  check(1.0e-0, 1);
  check(2.0e0, 2);
  check(3.0e+0, 3);
  check(4.0e-0, 4);
  check(5.0e0, 5);
  check(6.0e+0, 6);
  check(7.0e-0, 7);
  check(8.0e0, 8);
  check(9.0e+0, 9);
  check(0.0e-0, 0);
  check(1.0e+0, 1);
  check(2.0e-0, 2);
  check(3.0e+0, 3);
  check(4.0e-0, 4);
  check(5.0e+0, 5);
  check(6.0e-0, 6);
  check(7.0e+0, 7);
  check(8.0e-0, 8);
  check(9.0e+0, 9);
  check(.0e+0, 0.0);
  check(.1e0, 0.1);
  check(.2e-0, 0.2);
  check(.3e0, 0.3);
  check(.4e+0, 0.4);
  check(.5e0, 0.5);
  check(.6e-0, 0.6);
  check(.7e0, 0.7);
  check(.8e+0, 0.8);
  check(.9e0, 0.9);
}
