// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For enum declarations, in addition to the `augment` modifier, we
/// allow declaring an enum (or augmentation of one) with no values. This is
/// useful if the introductory declaration wants to let the augmentation fill in
/// all values, or if the augmentation wants to add members but no values.
///
/// @description Checks that it is not an error if an enum augmentation
/// contains an empty list of values before `;`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

enum E1 {
  e0;
}

augment enum E1 {
  ;
}

enum E2 {
  e0;
}

augment enum E2 {
  ;
  void foo() {}
}

enum E3 {
  e0;
}

augment enum E3 {
  ;
  // Some comment
}

main() {
  print(E1);
  print(E2);
  print(E3);
}
