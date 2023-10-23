// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if the representation type of an
/// extension type declaration is a bottom type.
///
/// @description Checks that it is a compile-time error error if the
/// representation type of an extension type declaration is a bottom type.
/// @author sgrekhov22@gmail.com
/// @issue 53823, 53824

// SharedOptions=--enable-experiment=inline-class

extension type ET1(Never _) {}
//                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2<T extends Never>(T _) {}
//                           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET3<T extends Never>(int _) {} // no error

main() {
  print(ET1);
  print(ET2);
  print(ET3);
}
