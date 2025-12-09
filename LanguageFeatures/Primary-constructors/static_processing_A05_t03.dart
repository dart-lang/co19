// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a class, mixin class, enum, or extension type
/// declaration `D` with a primary constructor (note that it cannot be a
/// `<mixinApplicationClass>`, because that kind of declaration does not
/// syntactically support primary constructors). This declaration is treated as
/// a class, mixin class, enum, respectively extension type declaration without
/// a primary constructor which is obtained as described in the following. This
/// determines the dynamic semantics of a primary constructor.
/// ...
/// If `D` is an extension type, it is a compile-time error if the primary
/// constructor that `D` contains does not have exactly one parameter.
///
/// @description Check that it is a compile-time error if an extension type does
/// not contain a primary constructor that has exactly one declaring parameter
/// which is `final`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

extension type const ET1();
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2.someName();
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET3(int v1, final int _);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

extension type const ET4.someName(final int v1, final int v2);
//                                            ^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET5(int v1, [int v2 = 0]);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

extension type const ET6.someName([final int v1 = 1, final int _ = 2]);
//                                                 ^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET7(int v1, {int v2 = 0});
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

extension type const ET8.someName({final int v1 = 1, final int v2 = 2});
//                                                 ^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET9({required int v1, required int v2});
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

extension type const ET10.someName(int v1, {required final int v2 = 2});
//                                       ^
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
  print(ET8);
  print(ET9);
  print(ET10);
}
