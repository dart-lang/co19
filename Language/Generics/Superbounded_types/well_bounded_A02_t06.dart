// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is a compile-time to call a generic function
/// with two dependent type arguments that do not satisfy the bounds.
/// @Issue 37061
/// @author iarkh@unipro.ru

class A<X extends A<X>> {}
void testme<X extends Y, Y extends A<X>>() {}

main() {
  testme();
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  testme<Never, dynamic>();
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  testme<dynamic, Never>();
//       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  testme<dynamic, dynamic>();
//                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  testme<Null, Object?>();
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  testme<Object, Null>();
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  testme<Object, Object?>();
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  testme<Null, void>();
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  testme<void, Null>();
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  testme<void, void>();
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  testme<A<Null>, Null>();
//       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
