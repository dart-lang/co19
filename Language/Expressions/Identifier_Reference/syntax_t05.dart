/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An identifier expression consists of a single identifier; it
 * provides access to an object via an unqualified name.
 * identifier:
 *   IDENTIFIER
 * ;
 * IDENTIFIER_NO_DOLLAR:
 *   IDENTIFIER_START_NO_DOLLAR IDENTIFIER_PART_NO_DOLLAR*
 * ;
 * IDENTIFIER:
 *   IDENTIFIER_START IDENTIFIER_PART*
 * ;
 * IDENTIFIER_START:
 *   IDENTIFIER_START_NO_DOLLAR |
 *   '$'
 * ;
 * IDENTIFIER_START_NO_DOLLAR:
 *   LETTER |
 *   '_'
 * ;
 * IDENTIFIER_PART_NO_DOLLAR:
 *   IDENTIFIER_START_NO_DOLLAR |
 *   DIGIT
 * ;
 * IDENTIFIER_PART:
 *   IDENTIFIER_START |
 *   DIGIT
 * ;
 * LETTER:
 *   ‘a’ .. ‘z’ |
 *   ‘A’ ..‘Z’
 * ;
 * @description Checks that identifier can't contain '`' symbol.
 * @author msyabro
 */

main() {
  int? a`;
// [error line 43, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  String b` = "It's wrong!";
// [error line 47, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  var c`;
// [error line 51, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  d`;
// [error line 55, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
