// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
/// - An expression of the form `e1?e2:e3` is potentially constant if `e1`,
///   `e2`, and `e3` are all potentially constant expressions. It is further
///   constant if `e1` is a constant expression and either
///   1. `e1` evaluates to true and `e2` is a constant expression, or
///   2. `e1` evaluates to false and `e3` is a constant expression.
///
/// @description Checks that it is a compile-time error `e1` does not evaluate
/// to boolean.
/// @author ilya

const y = null ? true : 1;
//        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  const t = "true" as dynamic;
  const x = t ? 1 : 2;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}
