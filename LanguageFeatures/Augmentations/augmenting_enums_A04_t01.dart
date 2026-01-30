// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if:
/// ...
/// - An enum doesn't have any values after all augmentations are applied.
///
/// @description Checks that it is a compile-time error if introductory enum
/// has no values and augmentation also adds no values.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

enum E1 {}
//   ^^
// [analyzer] unspecified
// [cfe] unspecified

augment enum E1 {}

enum E2 {}
//   ^^
// [analyzer] unspecified
// [cfe] unspecified

augment enum E2 {;}

enum E3 {;}
//   ^^
// [analyzer] unspecified
// [cfe] unspecified

augment enum E3 {}

enum E4 {;}
//   ^^
// [analyzer] unspecified
// [cfe] unspecified

augment enum E4 {;}

enum E5 {
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
  void foo() {}
}

augment enum E5 {
  ;
  void bar() {}
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
  print(E5);
}
