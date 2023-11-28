// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is not an error when a non-function type alias
/// with a well-bounded type parameter is declared
/// @Issue 44830
/// @author iarkh@unipro.ru

class A<T extends A<T>> {}

typedef B1<X> = A<X>;
//                ^
// [analyzer] unspecified
// [cfe] unspecified

typedef B2<X extends A<dynamic>> = A<X>;
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

typedef B3<X extends A<Never>> = A<X>;

typedef B4<X extends A<void>> = A<X>;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(B1);
  print(B2);
  print(B3);
  print(B4);
}
