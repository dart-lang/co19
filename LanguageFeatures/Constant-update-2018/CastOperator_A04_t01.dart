// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion An expression of the form [e as T] is accepted as a potentially
/// and compile-time constant expression if [e] is potentially constant or
/// compile-time constant, respectively, and [T] is a compile-time constant type.
/// A compile-time constant type means any type that doesn't contain free type
/// variables, so the type expression always resolves to the exact same type.
/// @description Checks that an expression of the form [e as T] is not accepted
/// and causes compile time error if [T] is not a compile-time constant type.
/// @author iarkh@unipro.ru


class A {}
dynamic test = A();

main() {
  const A a = test as A;
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}
