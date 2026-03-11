// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We allow augment before class, extension type, and mixin
/// declarations. (Enums and extensions are discussed in subsequent sections.)
///
/// @description Checks that augmentation of a class-like declarations may have
/// ';' as a body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

const Meta = 1;

class C {}

augment class C;
@Meta
augment class C;

mixin M {}

augment mixin M;
@Meta
augment mixin M;

enum E {
  e0;
}

augment enum E;
@Meta
augment enum E;

class A {}
extension Ext on A {}

augment extension Ext;
@Meta
augment extension Ext;

extension type ET(int _) {}

augment extension type ET;
@Meta
augment extension type ET;

class MA = Object with M;

main() {
  C();
  MA();
  E.e0;
  A();
  ET(0);
}
