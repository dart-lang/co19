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
/// value is not a valid constant expression. Test switch statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type NumET(num n) implements num {}
extension type const IntET(int i) implements int {}

main() {
  Object value = Object();
  final v = IntET(0);

  switch (value) {
    case v:
//       ^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case IntET(0):
//       ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case v.i:
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
      break;
    case const NumET(1):
//             ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    default:
  }
}
