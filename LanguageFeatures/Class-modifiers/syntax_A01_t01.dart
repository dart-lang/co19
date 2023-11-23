// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Only the base modifier can appear before a mixin declaration.
///
/// @description Check that it is a compile-time error to specify any modifier
/// before a mixin declaration except `base`
/// @author sgrekhov22@gmail.com

  abstract mixin M1 {}
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final mixin M2 {}
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  sealed mixin M3 {}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  interface mixin M4 {}
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  mixin mixin M5 {}
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(M1);
  print(M2);
  print(M3);
  print(M4);
  print(M5);
}
