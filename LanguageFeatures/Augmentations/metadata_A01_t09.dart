// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration can have metadata attached to it.
///
/// @description Check that augmenting metadata is appended to the introductory
/// declaration. Test class-like declarations.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:mirrors';
import '../../Utils/expect.dart';

class Meta {
  const Meta();
}

class C {}

@Meta()
augment class C {}

mixin M {}

@Meta()
augment mixin M {}

enum E {
  e0;
}

@Meta()
augment enum E {
  ;
}

class A {}

extension Ext on A {}

@Meta()
augment extension Ext {}

extension type ET(int id) {}

@Meta()
augment extension type ET {}

main() {
  Expect.equals(
      Symbol('.Meta'), reflectClass(C).metadata[0].type.qualifiedName);
  Expect.equals(
      Symbol('.Meta'), reflectClass(M).metadata[0].type.qualifiedName);
  Expect.equals(
      Symbol('.Meta'), reflectClass(E).metadata[0].type.qualifiedName);
  // Extensions and extension types cannot be reflected therefore it is not
  // possible to check their metadata.
}
