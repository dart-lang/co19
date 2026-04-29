// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An identifier expression consists of a single identifier; it
/// provides access to an object via an unqualified name.
/// identifier:
///   IDENTIFIER
/// ;
/// IDENTIFIER_NO_DOLLAR:
///   IDENTIFIER_START_NO_DOLLAR IDENTIFIER_PART_NO_DOLLAR*
/// ;
/// IDENTIFIER:
///   IDENTIFIER_START IDENTIFIER_PART*
/// ;
/// IDENTIFIER_START:
///   IDENTIFIER_START_NO_DOLLAR |
///   '$'
/// ;
/// IDENTIFIER_START_NO_DOLLAR:
///   LETTER |
///   '_'
/// ;
/// IDENTIFIER_PART_NO_DOLLAR:
///   IDENTIFIER_START_NO_DOLLAR |
///   DIGIT
/// ;
/// IDENTIFIER_PART:
///   IDENTIFIER_START |
///   DIGIT
/// ;
/// LETTER:
///   ‘a’ .. ‘z’ |
///   ‘A’ ..‘Z’
/// ;
/// @description Checks that an identifier can't start with a digit.
/// @author msyabro

main() {
  if (1 > 2) {
    int? 1a;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    String 2b = "It's wrong!";
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    var 3c;
//      ^^
// [analyzer] unspecified
// [cfe] unspecified

  }
  if (1 > 2) {
    final 4d = 0;
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
