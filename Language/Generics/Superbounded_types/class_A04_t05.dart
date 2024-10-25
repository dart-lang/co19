// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// occurs as an element in the type list of an `implements` clause of an
/// extension type.
/// @author sgrekhov22@gmail.com

class A<T extends A<T>> {}

extension type ET1(A _) implements A {}
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2(A<dynamic> _) implements A<dynamic> {}
//                                            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
extension type ET3(A<Object?> _) implements A<Object?>{}
//                                            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
extension type ET4(A<void> _) implements A<void> {}
//                                         ^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET5(A<A<dynamic>> _) implements A<A<dynamic>> {}
//                                               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
extension type ET6(A<A<Object?>> _) implements A<A<Object?>> {}
//                                               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
extension type ET7(A<A<void>> _) implements A<A<void>> {}
//                                            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(ET5);
  print(ET6);
  print(ET7);
}
