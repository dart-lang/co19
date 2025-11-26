// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if there is no matching declaration.
///
/// @description Checks that it is a compile-time error to augment a default
/// unnamed constructor (that doesn't exist during augmentation).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C1 {}

augment class C1 {
  augment C1();
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {}

augment class C2 {
  augment C2.new() {}
//        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 {
  e0;
}

augment enum E1 {
  augment const E1();
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;
}

augment enum E2 {
  augment const E2.new();
//              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(E1);
  print(E2);
}
