// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a parameterized type [T] is
/// super-bounded when it is used in any of the following ways:
///   [T] is an immediate subterm of a new expression (16.15.1) or a constant
///   object expression
/// @description Checks that compile error is thrown when parametrized type is
/// used in [new] expression.
/// @author iarkh@unipro.ru


class A<T extends A<T>> {}

main() {
  A a1 = new A<dynamic>();
//       ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  A a2 = new A<Object?>();
//       ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  A a3 = new A<void>();
//       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  A a4 = new A<Null>();
//       ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  A a5 = new A<Never>();

  A a6  = new A<A<dynamic>>();
//            ^
// [cfe] Type argument 'A<dynamic>' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A'.
//              ^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  A a7  = new A<A<Object?>>();
//            ^
// [cfe] Type argument 'A<Object?>' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A'.
//              ^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  A a8  = new A<A<void>>();
//            ^
// [cfe] Type argument 'A<void>' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A'.
//              ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  A a9  = new A<A<Null>>();
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  A a10 = new A<A<Never>>();
}
