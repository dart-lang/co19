// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation of an enum type can add new members to the enum,
/// including new enum values. Enum values are appended in augmentation
/// application order.
///
/// @description Checks that it is a compile-time error if the same value is
/// added more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

enum E {
  e0;
}

augment enum E {
  e1;
}

augment enum E {
  e1;
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E);
}
