// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that DV is an extension type declaration named Name, and
/// V1 occurs as one of the <type>s in the <interfaces> of DV. In this case we
/// say that V1 is a superinterface of DV.
/// ...
/// A compile-time error occurs if any direct or indirect superinterface of DV
/// is the type Name or a type of the form Name<...>.
///
/// @description Checks that it is a compile-time error if an extension type has
/// a dependency on itself.
/// @author sgrekhov22@gmail.com

extension type ET1(int id) implements ET2 {}
//                                    ^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2(int id) implements ET3 {}
//                                    ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef ET1Alias = ET1;

extension type ET3(int id) implements ET1Alias {}
//                                    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET1);
  print(ET2);
  print(ET3);
}
