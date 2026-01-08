// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The extension also introduces a complete getter for the
/// representation variable.
///
/// @description Checks that it is a compile-time error to declare any complete
/// augmenting getter with the same name as the representation variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

extension type ET1(int id) {}

augment extension type ET1 {
  augment int get id => 0;
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int _id) {}

augment extension type ET2 {
  augment int get _id => 0;
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
}
