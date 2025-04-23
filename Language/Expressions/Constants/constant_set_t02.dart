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
/// - A constant set literal is a potentially constant and constant expression.
///
/// @description Checks that it is a compile-time error if in a constant set
/// literal of the form `const <T>{e1, ..., en}`, or `<T>{e1, ..., en}`, `T` is
/// not a constant type expression.
/// @author sgrekhov22@gmail.com

test<T extends num>() {
  const c1 = <T>{};
//            ^
// [analyzer] unspecified
// [cfe] unspecified
  print(const <T>{});
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test);
}
