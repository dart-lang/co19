// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is a compile-time error when a class with a not
/// well-bounded type parameter is declared
/// @author iarkh@unipro.ru

class A<T extends A<T>> {}

class B1<X extends A> {}
//       ^
// [cfe] Generic type 'A' can't be used without type arguments in a type variable bound.
//                 ^
// [analyzer] COMPILE_TIME_ERROR.NOT_INSTANTIATED_BOUND
class B2<X extends A<A>> {}
//       ^
// [cfe] Generic type 'A' can't be used without type arguments in a type variable bound.
//                   ^
// [analyzer] COMPILE_TIME_ERROR.NOT_INSTANTIATED_BOUND
class B3<X extends A<int>> {}
//                 ^
// [cfe] Type argument 'int' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A'.
//                   ^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS

main() {
  print(A);
  print(B1);
  print(B2);
  print(B3);
}
