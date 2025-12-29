// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When augmenting an extension type declaration, the parenthesized
/// clause where the representation type is specified is treated as a
/// constructor that has a single positional parameter, a single initializer
/// from the parameter to the representation field, and an empty body. This
/// constructor is complete.
///
/// @description Checks that a constructor whose name is `ET` can be augmented
/// by `ET.new` and vice versa.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

const meta = 0;

extension type ET1(int id) {}

augment extension type ET1 {
  augment @meta ET1.new(int id);
}

extension type ET2.new(int id) {}

augment extension type ET2 {
  augment @meta ET2(int id);
}

main() {
  Expect.equals(1, ET1(1).id);
  Expect.equals(2, ET2(2).id);
}
