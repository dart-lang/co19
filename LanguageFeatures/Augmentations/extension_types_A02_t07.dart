// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When augmenting an extension type declaration, the parenthesized
/// clause where the representation type is specified is treated as a
/// constructor that has a single positional parameter, a single initializer
/// from the parameter to the representation field, and an empty body. This
/// constructor is complete.
///
/// @description Checks that that it is a compile-time error if an augmentation
/// of an extension type's implicit constructor adds a redirection.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

extension type ET(int id) {
  ET.foo(this.id);
}

augment extension type ET {
  augment ET(int id): this.foo(id);
//                    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET);
}
