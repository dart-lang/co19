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
/// @description Checks that it is a compile-time error if in an expressions of
/// the form `e1 - e2`, `e1 * e2`, `e1 / e2`, `e1 ~/ e2`, `e1 % e2`, `e1 < e2`,
/// `e1 <= e2`, `e1 > e2`, or `e1 >= e2` operator doesn't denote an instance
/// member of `int` or `double`.
/// @author sgrekhov22@gmail.com

class C {
  final num value;
  const C(this.value);

  num operator -(num other) => value - other;
  num operator *(num other) => value * other;
  num operator /(num other) => value / other;
  num operator ~/(num other) => value ~/ other;
  num operator %(num other) => value % other;
  bool operator <(num other) => value < other;
  bool operator <=(num other) => value <= other;
  bool operator >(num other) => value > other;
  bool operator >=(num other) => value >= other;
}

main() {
  const cInt = C(1);
  const c1 = cInt - 1;
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c2 = cInt * 2;
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c3 = cInt / 2;
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c4 = cInt ~/ 2;
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c5 = cInt % 2;
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c6 = cInt > 2;
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c7 = cInt >= 2;
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c8 = cInt < 2;
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c9 = cInt <= 2;
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const cDouble = C(3.14);
  const c10 = cDouble - 1;
//           ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c11 = cDouble * 2;
//           ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c12 = cDouble / 2;
//           ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c13 = cDouble ~/ 2;
//           ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c14 = cDouble % 2;
//           ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c15 = cDouble > 2;
//           ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c16 = cDouble >= 2;
//           ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c17 = cDouble < 2;
//           ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c18 = cDouble <= 2;
//           ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
