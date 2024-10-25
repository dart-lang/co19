// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a parameterized type `T` is
/// super-bounded when it is used in any of the following ways:
/// ...
/// - `T` is an immediate subterm of an `extends` clause of a class, or it
/// occurs as an element in the type list of an `implements` clause, or a `with`
/// clause, or it occurs as an element in the type list of an `on` clause of a
/// mixin.
///
/// @description Checks that it is a compile-time error if a super-bounded class
/// occurs as an element in a type list of `with` clause
/// @author iarkh@unipro.ru

mixin class A<T extends A<T>> {}
class C {}

class B1 extends C with A {}
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

class B2 extends C with A<dynamic> {}
//                        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class B3 extends C with A<Object?> {}
//                        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class B4 extends C with A<void> {}
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

class B5 extends C with A<A<dynamic>> {}
//                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class B6 extends C with A<A<Object?>> {}
//                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
class B7 extends C with A<A<void>> {}
//                        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(B1);
  print(B2);
  print(B3);
  print(B4);
  print(B5);
  print(B6);
  print(B7);
}
