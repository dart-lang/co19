// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a class, enum, or extension type declaration `D` with a
/// declaring header constructor, also known as a primary constructor.
/// ...
/// If `D` is an extension type, it is a compile-time error if `D`
/// does not contain a declaring constructor that has exactly one declaring
/// parameter which is `final`.
///
/// @description Check that it is a compile-time error if an extension type does
/// not contain a declaring constructor that has exactly one declaring parameter
/// which is `final`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

extension type const ET1();
//                   ^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2.someName();
//                 ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET3 {
  this();
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4 {
  const this.someName();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
