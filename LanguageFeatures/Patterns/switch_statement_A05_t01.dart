// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We extend switch statements to allow patterns in cases:
///
/// switchStatement         ::= 'switch' '(' expression ')'
///                         '{' switchStatementCase* switchStatementDefault? '}'
/// switchStatementCase     ::= label* 'case' guardedPattern ':' statements
/// guardedPattern          ::= pattern ( 'when' expression )?
/// switchStatementDefault  ::= label* 'default' ':' statements
/// ...
/// Many constant expressions are subsumed by the new pattern syntax so most
/// existing switch cases have the same semantics under this proposal. However,
/// patterns are not a strict superset of constant expressions and some switches
/// may be broken.
/// ...
/// Other constant expressions. Constant patterns allow simple literals and
/// references to named constants to be used directly as patterns, which covers
/// the majority of all existing switch cases. Also a constant constructor
/// explicitly prefixed with const is a valid constant expression pattern. But
/// some more complex expressions are valid constant expressions but not valid
/// constant patterns.
///
/// @description Checks that old-style constant expressions are not valid
/// constant patterns now and produce a compile-time error
/// @author sgrekhov22@gmail.com

String test(Object value) {
  switch (value) {
    case 1 + 2:
//         ^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =3";
    case 2 - 1:
//         ^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =1";
    case 2 * 2:
//         ^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =4";
    case 30 ^ 2:
//          ^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =28";
    case 1 | 4:
//         ^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =5";
    case 1 & 4:
//         ^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =0";
    case 15 % 8:
//          ^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =7";
    case 19 ~/ 8:
//          ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =2";
    case 19 >> 1:
//          ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =9";
    case 87 >>> 1:
//          ^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =43";
    case 19 << 1:
//          ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =38";
    case -1 > 2:
//          ^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =false";
    case -1 < 2:
//          ^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =true";
    case 1 >= 2:
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =false2";
    case -1 <= 2:
//          ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =true2";
    case 1 == -2:
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =false3";
    case 1 != 2:
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =true3";
    case "Lily" + " " "was" " " + "here":
//              ^
// [analyzer] unspecified
// [cfe] unspecified
      return "case String";
    case List<int>:
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "case =type";
    default:
      return "default";
  }
}

main() {
  test(42);
}
