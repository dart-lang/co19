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
 * @description Checks that the leading plus sign is parsed correctly.
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  Expect.equals(+1, 1);
  Expect.equals(+0, 0);
  Expect.equals(+1982356108356016923517293857109582093687209586171315023958236457,
                 1982356108356016923517293857109582093687209586171315023958236457);
  Expect.equals(+3.14, 3.14);
  Expect.equals(+6031769.6031769e6031769, 6031769.6031769E6031769);
}
