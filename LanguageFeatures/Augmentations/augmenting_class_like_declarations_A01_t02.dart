// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Mixin application classes can't be augmented.
///
/// @description Checks that it is a compile-time error to augment a mixin
/// application class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class A {}

mixin M {}

class C = A with M;

augment class C {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C);
}
