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
 * @description Checks that all decimal and hexadecimal digits are parsed
 * correctly.
 * @author iefremov
 */
import '../../../Utils/expect.dart';

main() {
  var v1 = 1234567890.0987654321e1234567890;
  Expect.equals(1234567890.0987654321e1234567890, v1);
  Expect.equals(double.infinity, v1);

  var v2 = 01234567899876543210;
  Expect.equals(01234567899876543210, v2);
  Expect.equals("1234567899876543210", v2.toString());

  var v3 = 01234567899876543210.01234567899876543210;
  Expect.equals(1.23456789987654323E18, v3);
}
