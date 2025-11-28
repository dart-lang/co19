// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Enum values themselves can't be augmented since they are
/// essentially constant variables and constant variables can't be augmented.
///
/// @description Checks that it is a compile-time error to augment enum's
/// implicit getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

enum E1 {
  e0;
}

augment enum E1 {
  e1;
  augment static E1 get e0;
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;
}

augment enum E2 {
  e1;
  augment static E2 get e0 => e0;
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
}
