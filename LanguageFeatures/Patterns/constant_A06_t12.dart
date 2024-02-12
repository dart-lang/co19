// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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

// SharedOptions=--enable-experiment=inline-class

extension type NumET(num n) implements num {}
extension type const IntET(int i) implements int {}

int test() {
  Object value = Object();
  final v = IntET(0);

  return switch (value) {
    v => 1,
//  ^
// [analyzer] unspecified
// [cfe] unspecified
    IntET(1) => 2,
//  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    v.i => 3,
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
    const NumET(4) => 4,
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    const (NumET(5).n) => 5,
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _  => -1
  };
}

main() {
  test();
}
