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
///
/// Simple "primitive" literals like Booleans and numbers are valid patterns
/// since they aren't ambiguous.
///
/// @description Check that it is a compile-time error if [Symbol] is used in
/// constant patterns. Test if-case statement
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

void test(Symbol value) {
  if (value case #+) {
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
  } else if (value case #foo) {
//                      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  test(Symbol("foo"));
}
