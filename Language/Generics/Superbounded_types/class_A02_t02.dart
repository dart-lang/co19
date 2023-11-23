// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a parameterized type [T] is
/// super-bounded when it is used in any of the following ways:
///   [T] is an immediate subterm of a new expression (16.15.1) or a constant
///   object expression
/// @description Checks that compile error is thrown when parametrized type is
/// used with constructor in the constant object expression.
/// @author iarkh@unipro.ru


class A<T extends A<T>> {
  const A();
}

main() {
  const a1 = A<dynamic>();
//           ^
// [cfe] Type argument 'dynamic' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A'.
//             ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  const a2 = A<Object?>();
//           ^
// [cfe] Type argument 'Object?' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A'.
//             ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  const a3 = A<void>();
//           ^
// [cfe] Type argument 'void' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A'.
//             ^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  const a4 = A<Null>();
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const a5 = A<Never>();

  const a6 = A<A<dynamic>>();
//           ^
// [cfe] Type argument 'A<dynamic>' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A'.
//             ^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  const a7 = A<A<Object?>>();
//           ^
// [cfe] Type argument 'A<Object?>' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A'.
//             ^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  const a8 = A<A<void>>();
//           ^
// [cfe] Type argument 'A<void>' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A'.
//             ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  const a9 = A<A<Null>>();
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const a0 = A<A<Never>>();
}
