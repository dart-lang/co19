// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a parameterized type `T` is
/// super-bounded when it is used in any of the following ways:
/// - `T` is an immediate subterm of a new expression or a constant object
///   expression.
///
/// @description Checks that it is a compile-time error if a parameterized
/// super-bounded type is used in a constant constructor invocation.
/// @author iarkh@unipro.ru

class A<T extends A<T>> {
  const A();
}

main() {
  const a1 = A<dynamic>();
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const a2 = A<Object?>();
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const a3 = A<void>();
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const a4 = A<Null>();
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const a5 = A<Never>();

  const a6 = A<A<dynamic>>();
//             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const a7 = A<A<Object?>>();
//             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const a8 = A<A<void>>();
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const a9 = A<A<Null>>();
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const a10 = A<A<Never>>();
}
