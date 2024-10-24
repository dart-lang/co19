// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is a compile-time error if a malbounded type is
/// used as the right hand operand in an `as` expression.
/// @author iarkh@unipro.ru

class A<T extends A<T>> {}

main() {
  var b1 = null as A<int>?;
//                   ^^^
// [analyzer] unspecified
// [cfe] unspecified
  var b2 = null as A<A<int>>?;
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var b3 = null as A<Object>?;
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var b4 = null as A<A<Object>>?;
//                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
