// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion relationalPattern ::=
///   ( equalityOperator | relationalOperator) bitwiseOrExpression
///
/// A relational pattern lets you compare the matched value to a given constant
/// using any of the equality or relational operators: ==, !=, <, >, <=, and >=.
/// The pattern matches when calling the appropriate operator on the matched
/// value with the constant as an argument returns true.
///
/// It is a compile-time error if bitwiseOrExpression is not a valid constant
/// expression.
///
/// @description Check that it is a compile-time error if `bitwiseOrExpression`
/// is not a valid constant expression. Test switch statement
/// @author sgrekhov22@gmail.com
/// @issue 54627

// SharedOptions=--enable-experiment=inline-class

extension type const IntET1(int _) {}
extension type const IntET2(int _) implements int, IntET1 {}

void test(Object o) {
  switch (o) {
    case == IntET1(0):
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case == IntET2(1):
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
 }
}

main() {
  test(42);

  IntET2 e = IntET2(0);
  switch (e) {
    case == IntET1(0):
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case > IntET1(0):
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
