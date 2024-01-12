// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// The potentially constant expressions and constant expressions are the
/// following:
/// . . .
/// • An expression of the form e1 + e2 is a potentially constant expression if
///   e1 and e2 are both potentially constant expressions. It is further a
///   constant expression if both e1 and e2 are constant expressions and either
///   both evaluate to an instance of int or double, or both evaluate to an
///   instance of String, such that ‘+’ denotes an instance operator invocation.
/// • An expression of the form -e1 is a potentially constant expression if e1
///   is a potentially constant expression. It is further a constant expression
///   if e1 is a constant expression that evaluates to an instance of type int
///   or double, such that ‘-’ denotes an instance operator invocation.
/// • An expression of the form e1 - e2, e1 * e2, e1 / e2, e1 ~/ e2, e1 % e2,
///   e1 < e2, e1 <= e2, e1 > e2, or e1 >= e2 is potentially constant if e1 and
///   e2 are both potentially constant expressions. It is further constant if
///   both e1 and e2 are constant expressions that evaluate to instances of int
///   or double, such that the given operator symbol denotes an invocation of an
///   instance operator
///
/// @description Checks that it is a compile-time error if in an expression of
/// the form `e1 - e2` doesn't denote an instance member of `int` or `double`
/// @author sgrekhov22@gmail.com
/// @issue 54545

// SharedOptions=--enable-experiment=inline-class

extension type const ExtNum1(num _) implements num {}

extension type const ExtNum2(num value) implements num {
  num operator -(num other) => value - other;
}

extension type const ExtInt1(int _) implements int {}

extension type const ExtInt2(int value) implements int {
  num operator -(num other) => value - other;
}

extension type const ExtDouble1(double _) implements double {}

extension type const ExtDouble2(double value) implements double {
  num operator -(num other) => value - other;
}

void main() {
  const c1 = ExtNum1(1) - 1; // Ok
  const c2 = ExtNum2(1) - 1;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  const c3 = ExtNum1(3.14) - 3.14; // Ok
  const c4 = ExtNum2(3.14) - 3.14;
//                         ^
// [analyzer] unspecified
// [cfe] unspecified

  const c5 = ExtInt1(1) - 1; // Ok
  const c6 = ExtInt2(1) - 1;
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  const c7 = ExtDouble1(3.14) - 3.14; // Ok
  const c8 = ExtDouble2(3.14) - 3.14;
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
}
