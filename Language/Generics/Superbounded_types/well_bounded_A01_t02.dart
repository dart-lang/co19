// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is a compile-time error to declare a variable
/// with a type parameter which is not well-bounded
/// @author iarkh@unipro.ru

class A<T extends A<T>> {}

main() {
  A<Object> a0;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  A<int> a1;
//  ^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
//^
// [cfe] Type argument 'int' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A'.
  A<A<int>> a2;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  A<A<A<int>>> a3;
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  A<A<Object>>  a4;
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  A<Null> a5;
//  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  A<A<Null>> a6;
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
