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
/// @description Checks that it is a compile-time error if in an expression
/// `e1 + e2` operator `+` doesn't denote an instance member of `int`, `double`
/// or `String`
/// @author sgrekhov22@gmail.com

class C1 {
  final num value;
  const C1(this.value);

  num operator +(num other) => value + other;
}

class C2 {
  final String value;
  const C2(this.value);

  String operator +(String other) => value + other;
}

void main() {
  const c1 = C1(1) + 1;
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c2 = C1(3.14) + 3.14;
//           ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const c3 = C2("a") + "b";
//           ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
