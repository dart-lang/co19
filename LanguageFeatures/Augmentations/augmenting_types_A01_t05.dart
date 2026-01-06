// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Mixin application classes can't be augmented.
///
/// @description Checks that `augment class C = ...` is a syntax error.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class A {}

mixin M on A {}

class C = A with M;

augment class C = A with M;
//            ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C);
}
