// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For enum declarations, in addition to the `augment` modifier, we
/// allow declaring an enum (or augmentation of one) with no values. This is
/// useful if the introductory declaration wants to let the augmentation fill in
/// all values, or if the augmentation wants to add members but no values.
///
/// When there are no values, the enum still requires a leading `;` before the
/// first member to avoid ambiguity.
///
/// @description Checks that it is a compile-time error if an enum with no
/// values has no leading `;` before the first member.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

enum E1 {
  e0;
}

augment enum E1 {
  void foo() {}
//^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  void foo() {}
//^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E2 {
  e0;
}

main() {
  print(E1);
  print(E2);
}
