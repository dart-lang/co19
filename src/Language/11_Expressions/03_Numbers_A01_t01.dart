/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A numeric literal is either a decimal or hexadecimal integer of arbitrary size,
 * or a decimal double. 
 *  NUMBER: '+' ? DIGIT+ ('.' DIGIT+)? EXPONENT? | '+' ? '.' DIGIT+ EXPONENT?
 *  EXPONENT: ('e' | 'E') ('+' | '-')? DIGIT+
 *  HEX NUMBER: '0x' HEX DIGIT+ | '0X' HEX DIGIT+ ;
 *  HEX DIGIT: 'a'..'f' | 'A'..'F' | DIGIT ;
 * @description Checks different decimal numeric literals without a decimal point or exponent.
 * @author hlodvig
 * @reviewer iefremov
 * @reviewer rodionov
 */

void check(i, expected){
  Expect.isTrue(i is num);
  Expect.isTrue(expected is num);
  Expect.equals(expected, i);
}

main() {
  check(+0, 0);
  check(+1, 1);
  check(+2, 2);
  check(+3, 3);
  check(+4, 4);
  check(+5, 5);
  check(+6, 6);
  check(+7, 7);
  check(+8, 8);
  check(+9, 9);
  check(+00, 0);
  check(+01, 1);
  check(+02, 2);
  check(+03, 3);
  check(+04, 4);
  check(+05, 5);
  check(+06, 6);
  check(+07, 7);
  check(+08, 8);
  check(+09, 9);
  check(+11, 11);
  check(+22, 22);
  check(+33, 33);
  check(+44, 44);
  check(+55, 55);
  check(+66, 66);
  check(+77, 77);
  check(+88, 88);
  check(+99, 99);
}
