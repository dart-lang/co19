// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All usages of ’constant’ in Dart are associated with compile time.
/// A potentially constant expression is an expression that will generally yield
/// a constant value when the values of certain parameters are given. The
/// constant expressions is a subset of the potentially constant expressions
/// that can be evaluated at compile time.
///
/// The potentially constant expressions and constant expressions are the
/// following:
/// ...
/// • A literal string with string interpolations with expressions `e1, ..., en`
///   is a potentially constant expression if `e1, ..., en` are potentially
///   constant expressions. The literal is further a constant expression if
///   `e1, . . . , en` are constant expressions evaluating to instances of `int`,
///   `double`, `String`, `bool`, or `Null`.
///
/// @description Checks that a string literal that involves string interpolation,
/// that is a constant expression not evaluated to `int`, `double`, `String`,
/// `bool`, or `Null` cannot be assigned to a constant variable.
/// @author iefremov

class C {
  const C();
}

const c1 = "${const {'k1': 1, 'k2': 2}}";
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

const c2 = "${#foo}";
//          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

const c = C();

const c3 = "$c";
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(c1);
  print(c2);
  print(c3);
}
