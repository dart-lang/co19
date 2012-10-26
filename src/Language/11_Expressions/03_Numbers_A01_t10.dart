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
 * @description Checks that leading zeros don't affect the number.
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  Expect.equals(1, 01);
  Expect.equals(1, 0000000000000000000000000000000000000000000000000000000000000000000001);
  Expect.equals(1, +0000000000000000000000000000000000000000000000000000000000000000000001);
  Expect.equals(6031769, +0000000000000000000000000000000000000000000000000000000000000000000006031769);
  Expect.equals(60317696031769603176960317696031769,
  +00000000000000000000000000000000000000000000000000000000000000000000060317696031769603176960317696031769);

  Expect.equals(1, 0x01);
  Expect.equals(1, 0x000000000000000000000000000000000000000000000000000000000000000000001);
  Expect.equals(523725682077427696990501445941159195252585, 0x0000000000000000000000000000000000000000000000000000000000000000000060317696031769603176960317696031769);
}
