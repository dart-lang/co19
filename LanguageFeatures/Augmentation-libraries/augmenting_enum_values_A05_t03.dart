// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Some enum members can not be augmented: It is a compile-time
/// error if an augmenting declaration in an enum declaration (introductory or
/// augmenting) has the name `values`, `index`, `hashCode`, or `==`.
///
/// @description Checks that it is a compile-time error if an enum's
/// augmentation declares `index`, `hashCode` or `==` members.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

enum E1 {
  e0;
}

augment enum E1 {
  augment e0;
  int get index => 0;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;
}

augment enum E2 {
  augment e0;
  int get hashCode => 0;
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3 {
  e0;
}

augment enum E3 {
  augment e0;
  bool operator ==(Object other) => true;
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
  print(E3);
}
