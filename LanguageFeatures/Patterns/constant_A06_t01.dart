// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion constantPattern ::= booleanLiteral
///                   | nullLiteral
///                   | numericLiteral
///                   | stringLiteral
///                   | identifier
///                   | qualifiedName
///                   | constObjectExpression
///                   | 'const' typeArguments? '[' elements? ']'
///                   | 'const' typeArguments? '{' elements? '}'
///                   | 'const' '(' expression ')'
///
/// A constant pattern determines if the matched value is equal to the
/// constant's value. We don't allow all expressions here because many
/// expression forms syntactically overlap other kinds of patterns. We avoid
/// ambiguity while supporting terse forms of the most common constant
/// expressions like so:
/// ...
/// It is a compile-time error if a constant pattern's value is not a valid
/// constant expression.
///
/// @description Check that it is a compile-time error if a constant pattern's
/// value is not a valid constant expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

class C {
  final v = 42;
  static final s = "s";
}

main() {
  Object value = Object();
  int x = 1;
  final s = "";
  C c = C();
  switch (value) {
    case x:
//       ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case s:
//       ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case C.s:
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case c:
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    case const C():
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case const (C().v):
//       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case "x is $x":
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    default:
  }
}
