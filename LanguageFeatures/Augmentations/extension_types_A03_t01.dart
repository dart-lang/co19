// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion That primary constructor's parameter declaration is also an
/// introductory and complete getter declaration for a getter with the same name
/// and type as the parameter declaration.
///
/// @description Checks that a getter for the representation variable can be
/// augmented by an incomplete getter declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

const meta = 0;

extension type ET1(int id) {}

augment extension type ET1 {
  @meta
  augment abstract final int id;
}

extension type ET2(int id) {}

augment extension type ET2 {
  @meta
  augment int get id;
}

main() {
  Expect.equals(1, ET1(1).id);
  Expect.equals(2, ET1(2).id);
}
