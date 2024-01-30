// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A potentially constant expression is an expression that will
/// generally yield a constant value when the values of certain parameters are
/// given. The constant expressions is a subset of the potentially constant
/// expressions that can be evaluated at compile time.
/// ...
/// The potentially constant expressions and constant expressions are the
/// following:
/// ...
/// • A constant set literal, const <T>{e1, ..., en}, or <T>{e1, ..., en} that
///   occurs in a constant context, is a potentially constant expression if T is
///   a constant type expression, and e1, . . . , en are constant expressions.
///   It is further a constant expression if the set literal evaluates to an
///   object.
///
/// @description Checks that it is a compile-time error if in a constant set
/// literal of the form `const <T>{e1, ..., en}`, or `<T>{e1, ..., en}`, any of
/// `ei` is not a constant expression
/// @author sgrekhov22@gmail.com

final nonconstant1 = 1;

const a = {nonconstant1};
//         ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

Set<int> get test => const {1, nonconstant1};
//                             ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  final int nonconstant2 = 1;

  const C();

  Set<int> get test1 => const {nonconstant2, 2};
//                             ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  Set<int> test2() => const {0, nonconstant2, 2};
//                              ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(a);
  print(test);
  print(C);
}
