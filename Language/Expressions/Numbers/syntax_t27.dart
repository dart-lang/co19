// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that the exponent part of a literal must contain at
/// least one digit.
/// @author iefremov


main() {
  var i = 1e+;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}
