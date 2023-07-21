// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error for the declaration of a variable
/// which is not an instance variable to include the modifier covariant.
///
/// @description Checks that a compile-time error if not-instance variable has a
/// modifier `covariant`
/// @author sgrekhov22@gmail.com

  covariant var c1 = 1;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  covariant int c2 = 2;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static covariant var c3 = 3;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static covariant int c4 = 4;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  covariant var c5 = 5;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  covariant int c6 = 6;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
