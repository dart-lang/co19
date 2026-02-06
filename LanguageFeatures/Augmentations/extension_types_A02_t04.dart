// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When augmenting an extension type declaration, the parenthesized
/// clause where the representation type is specified is treated as a
/// constructor that has a single positional parameter, a single initializer
/// from the parameter to the representation field, and an empty body. This
/// constructor is complete.
///
/// @description Checks that an primary constructor of an extension type may be
/// augmented by an incomplete augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

extension type ET1(int id) {}

augment extension type ET1 {
  augment ET1(int id);
}

extension type ET2.foo(int id) {}

augment extension type ET2 {
  augment ET2.foo(int id);
}

main() {
  Expect.equals(1, ET1(1).id);
  Expect.equals(2, ET2.foo(2).id);
}
