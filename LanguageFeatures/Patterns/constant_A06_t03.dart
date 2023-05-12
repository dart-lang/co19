// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion constantPattern ::= booleanLiteral
///                   | nullLiteral
///                   | '-'? numericLiteral
///                   | stringLiteral
///                   | symbolLiteral
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
/// value is not a valid constant expression. Test switch expression
/// @author sgrekhov22@gmail.com

class C {
  final v = 42;
  static final s = "s";
}

int test() {
  Object value = Object();
  int x = 1;
  final s = "";
  C c = C();
  return switch (value) {
    x => 1,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    s => 2,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    C.s => 3,
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
    c => 4,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    const C() => 5,
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    const (C().v) => 6,
//  ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    "x is $x" => 7,
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _  => -1
  };
}

main() {
  test();
}
