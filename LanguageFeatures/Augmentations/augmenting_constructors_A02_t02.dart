// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - More than one declaration in the augmentation chain specifies a default
///   value for the same optional parameter. This is an error even in the case
///   where all of them are identical.
///
/// @description Checks that it is a compile-time error when both the augmenting
/// constructor parameters and the introductory declaration specify default
/// values. Test primary constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class C1([var int x = 0]);

augment class C1 {
  augment C([int x = 0]);
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2({int x = 0});

augment class C2 {
  augment C2({int x = 0});
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1([int x = 0]) {
  e0;
}

augment enum E1 {
  ;
  augment const E1([int x = 0]);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2({final int x = 0}) {
  e0;
}

augment enum E2 {
  ;
  augment const E2({int x = 0});
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(E1);
  print(E2);
}
