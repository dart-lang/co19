// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When augmenting an extension type declaration, the parenthesized
/// clause where the representation type is specified is treated as a
/// constructor that has a single positional parameter, a single initializer
/// from the parameter to the representation field, and an empty body. This
/// constructor is complete.
///
/// @description Checks that it is not an error if an augmentation of a primary
/// constructor of an extension type has a metadata.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

const meta = 0;

extension type ET1(int id) {}

augment extension type ET1 {
  @meta
  augment  ET1(int id);
}

extension type ET2.foo(int id) {}

augment extension type ET2 {
  @meta
  augment  ET2.foo(int id);
}

extension type ET3.new(int id) {}

augment extension type ET3 {
  @meta
  augment ET3.new(int id);
}

main() {
  Expect.equals(1, ET1(1).id);
  Expect.equals(2, ET2(2).id);
  Expect.equals(3, ET3(3).id);
}
