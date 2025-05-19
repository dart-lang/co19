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
/// @description Checks that augmenting enums with no members are allowed.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

enum E1 {
  e0;
}

augment enum E1 {
}

enum E2 {e0;}

augment enum E2 {;}

main() {
  Expect.listEquals([E1.e0], E1.values);
  Expect.listEquals([E2.e0], E2.values);
}
