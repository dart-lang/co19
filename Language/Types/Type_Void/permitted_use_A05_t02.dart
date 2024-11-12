// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In support of the notion that the value of an expression with
/// static type `void` should be discarded, such objects can only be used in
/// specific situations: The occurrence of an expression of type `void` is a
/// compile-time error unless it is permitted according to one of the following
/// rules.
/// ...
/// - In a conditional expression `e ? e1 : e2`, `e1` and `e2` may have type
///   `void`.
///
/// @description Checks that if in a conditional expression `e ? e1 : e2`, `e1`
/// or `e2` have type `void` then the static type of the whole expression is
/// `void` and it is a compile-time error to use a value of this expression.
/// @author sgrekhov22@gmail.com

void foo() => 42;

main() {
  print((2 > 1) ? 1 : foo());
//      ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print((2 > 1) ? foo() : 1);
//      ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
