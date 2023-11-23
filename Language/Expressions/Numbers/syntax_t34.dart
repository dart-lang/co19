// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A numeric literal is either a decimal or hexadecimal integer of
/// arbitrary size, or a decimal double.
///
/// numericLiteral:
///   NUMBER|
///   HEX_NUMBER
///;
/// NUMBER:
///   DIGIT+ ('.' DIGIT+)? EXPONENT? |
///  '.' DIGIT+ EXPONENT?
/// ;
/// EXPONENT:
///   ('e' | 'E') ('+' | '-')? DIGIT+
/// ;
/// HEX NUMBER:
///   '0x' HEX DIGIT+ |
///   '0X' HEX DIGIT+
/// ;
/// HEX DIGIT:
///   'a'..'f' |
///   'A'..'F' |
///   DIGIT
/// ;
/// @description Check that various large positive decimal and hexadecimal
/// integer numbers produce compile error on JavaScript and no errors on
/// non-JavaScript configurations
/// @author sgrekhov@unipro.ru


main() {
  9223372036854775807;
//^^^^^^^^^^^^^^^^^^^
// [web] unspecified

  0x7FFFFFFFFFFFFFFF;
//^^^^^^^^^^^^^^^^^^
// [web] unspecified
}
