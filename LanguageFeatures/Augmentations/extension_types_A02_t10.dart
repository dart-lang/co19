// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When augmenting an extension type declaration, the parenthesized
/// clause where the representation type is specified is treated as a
/// constructor that has a single positional parameter, a single initializer
/// from the parameter to the representation field, and an empty body. This
/// constructor is complete.
///
/// @description Checks that it is a compile-time error if an augmentation of a
/// primary constructor of an extension type adds a metadata.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

const meta = 0;

extension type ET1(int id) {}

augment extension type ET1 {
  augment @meta ET1(int id);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2.foo(int id) {}

augment extension type ET2 {
  augment @meta ET2.foo(int id);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3.new(int id) {}

augment extension type ET3 {
  augment @meta ET3.new(int id);
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
}
