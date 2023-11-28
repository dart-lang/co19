// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is a compile-time error when a non-function type
/// has a type parameter bound which is a raw type that does not have simple
/// bounds, and when a function has a type parameter bound which is malbounded.
/// @author iarkh@unipro.ru

class A<T extends A<T>> {}

// Here B1 is a well-bounded type but the bound is a raw type A<A<dynamic>> that
// doesn't have simple bounds
typedef B1<X extends A> = A<X>;
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B2<X extends A<A>> = A<X>;
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B3<X extends A<int>> = A<X>; // A<int> is a  mailbounded type
//                     ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(B1);
  print(B2);
  print(B3);
}
