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
 * @description Checks different decimal numeric literals with exponent and
 * decimal point.
 * @author hlodvig
 * @reviewer iefremov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

void check(i, [expected = null]) {
  Expect.isTrue(i is num);
  Expect.equals(expected, i);
}

main() {
  check(0.0e+1, 0);
  check(-1.0e+1, -10);
  check(2.0E1, 20);
  check(-3.0e+1, -30);
  check(4.0e1, 40);
  check(-5.0e+1, -50);
  check(6.0e1, 60);
  check(-7.0E+1, -70);
  check(8.0e1, 80);
  check(-9.0e+1, -90);
  check(0.0e-1, 0.0);
  check(-1.0e-1, -0.1);
  check(2.0e-1, 0.2);
  check(-3.0e-1, -0.3);
  check(4.0E-1, 0.4);
  check(-5.0e-1, -0.5);
  check(6.0e-1, 0.6);
  check(-7.0E-1, -0.7);
  check(-8.0e-1, -0.8);
  check(9.0e-1, 0.9);
  check(-.0e1, -0);
  check(.1e+1, 1);
  check(-.2e1, -2);
  check(.3E+1, 3);
  check(-.4e1, -4);
  check(.5e+1, 5);
  check(-.6E1, -6);
  check(.7e+1, 7);
  check(-.8e1, -8);
  check(.9e+1, 9);
  check(-.000000000000000000000000124614151241245e-00000124612525124124, -124614.151241245e-124612525124130);
  check(000002452350.032523500235235E+0012042014012051205, 24.52350032523500235235e12042014012051200);
}
