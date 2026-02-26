// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We allow augment before class, extension type, and mixin
/// declarations. (Enums and extensions are discussed in subsequent sections.)
///
/// @description Checks that augmentation of a class, mixin or extension type
/// may have no body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class C {}

augment class C;

mixin M {}

augment mixin M;

extension type ET(int _) {}

augment extension type ET;

main() {
  print(C);
  print(M);
  print(ET);
}
