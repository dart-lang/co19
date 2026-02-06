// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When augmenting an extension type declaration, the parenthesized
/// clause where the representation type is specified is treated as a
/// constructor that has a single positional parameter, a single initializer
/// from the parameter to the representation field, and an empty body. This
/// constructor is complete.
///
/// @description Checks that it is a compile-time error when an augmentation of
/// an extension type's primary constructor has initializing formals.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

extension type ET(int id) {}

augment extension type ET {
  augment ET(this.id);
//           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET);
}
