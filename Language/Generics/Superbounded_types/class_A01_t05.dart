// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a parameterized type `T` is
/// super-bounded when it is used in any of the following ways:
/// - `T` is an immediate subterm of a new expression or a constant object
///   expression.
///
/// @description Checks that it is a compile-time error if a parametrized
/// super-bounded type is used in a constant `is` expression and not a top type.
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
