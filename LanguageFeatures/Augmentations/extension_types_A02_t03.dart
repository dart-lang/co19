// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When augmenting an extension type declaration, the parenthesized
/// clause where the representation type is specified is treated as a
/// constructor that has a single positional parameter, a single initializer
/// from the parameter to the representation field, and an empty body. This
/// constructor is complete.
///
/// @description Checks that it is a compile-time error if an augmentation of an
/// extension type's implicit constructor has a signature which doesn't exactly
/// match the introductory constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

extension type ET1(int id) {}

augment extension type ET1 {
  augment ET1(int id, int x);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int id) {}

augment extension type ET2 {
  augment ET2(int id, [int x = 0]);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(int id) {}

augment extension type ET3 {
  augment ET3(int id, {int x = 0});
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4(int id) {}

augment extension type ET4 {
  augment ET4([int id = 0]);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET5(int id) {}

augment extension type ET5 {
  augment ET5({int id = 0});
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET6(int id) {}

augment extension type ET6 {
  augment ET6({required int id});
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET7(num id) {}

augment extension type ET7 {
  augment ET7(Object id);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment ET7(int id);
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(ET5);
  print(ET6);
  print(ET7);
}
