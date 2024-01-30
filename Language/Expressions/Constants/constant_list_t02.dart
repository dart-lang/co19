// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// . . .
/// • A constant list literal, const <T>[e1, ..., en], or <T>[e1,..., en] that
///   occurs in a constant context, is a potentially constant expression if T is
///   a constant type expression, and e1, . . . , en are constant expressions.
///   It is further a constant expression if the list literal evaluates to an
///   object.
///
/// @description Checks that it is a compile-time error if in a constant list
/// literal of the form const `<T>[e1, ..., en]`, or `<T>[e1, ..., en]`, `T` is
/// not a constant type expression
/// @author iefremov

test<T extends num>() {
  const c1 = <T>[];
//            ^
// [analyzer] unspecified
// [cfe] unspecified
  print(const <T>[]);
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test);
}
