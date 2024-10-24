// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a parameterized type `T` is
/// super-bounded when it is used in any of the following ways:
/// - `T` is an immediate subterm of a new expression or a constant object
///   expression.
///
/// @description Checks that it is a compile-time error if a super-bounded type
/// is an immediate subterm of a constant object expression.
/// @author iarkh@unipro.ru

class A<T extends A<T>> {
  const A();
}

main() {
  var a1 = const A<dynamic>();
//                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var a2 = const A<Object?>();
//                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var a3 = const A<void>();
//                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var a4 = const A<Null>();
//                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var a6 = const A<A<dynamic>>();
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var a7 = const A<A<Object?>>();
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var a8 = const A<A<void>>();
//                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var a9 = const A<A<Null>>();
//                 ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
