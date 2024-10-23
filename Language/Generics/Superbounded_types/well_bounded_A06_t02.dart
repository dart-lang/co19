// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is a compile-time error if not a well-bounded
/// type is used as a right hand operand in an `is` expression.
/// @author iarkh@unipro.ru

class A<T extends A<T>> {}

main() {
  bool b1 = 1 is A<int>;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool b2 = 1 is A<A<int>>;
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool b3 = 1 is A<Object>;
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  bool b4 = 1 is A<A<Object>>;
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
