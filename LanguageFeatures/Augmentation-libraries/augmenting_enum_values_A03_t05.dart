// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion New enum values may be defined in an augmenting enum, and they
/// will be appended to the current values of the declaration in augmentation
/// application order.
///
/// @description Checks that it is a syntax error if an enum augmentation
/// contains an empty list of values.
/// @author sgrekhov22@gmail.com
/// @issue 56883

// SharedOptions=--enable-experiment=macros

enum E1 {
  e0;
}

augment enum E1 {
  ;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;
}

augment enum E2 {
  ;
//^
// [analyzer] unspecified
// [cfe] unspecified
  void foo() {}
}

main() {
  print(E1);
  print(E2);
}
