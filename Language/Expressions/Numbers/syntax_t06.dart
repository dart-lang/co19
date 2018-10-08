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
 * @description Checks various large positive decimal and hexadecimal integer
 * numbers.
 * @author iefremov
 */
import '../../../Utils/expect.dart';

main() {
  Expect.equals(2147483647, 0x7FFFFFFF);
  Expect.equals("2147483647", 2147483647.toString());
  Expect.equals("2147483647", 0x7FFFFFFF.toString());

  Expect.equals(2147483648, 0x80000000);
  Expect.equals("2147483648", 2147483648.toString());
  Expect.equals("2147483648", 0x80000000.toString());
  Expect.equals(2147483648, 1 << 31);
  Expect.equals(4294967295, 0xFFFFFFFF);

  Expect.equals(9223372036854775807, 0x7FFFFFFFFFFFFFFF);
  Expect.equals(-9223372036854775808, 0x8000000000000000);
  Expect.equals(-9223372036854775808, 1 << 63);

  Expect.equals("9223372036854775807", 9223372036854775807.toString());
  Expect.equals("9223372036854775807", 0x7FFFFFFFFFFFFFFF.toString());

  Expect.equals(-1, 0xFFFFFFFFFFFFFFFF);
  Expect.equals(1152921504606846976, 0x1000000000000000);
  Expect.equals(0, 1 << 64);
}
