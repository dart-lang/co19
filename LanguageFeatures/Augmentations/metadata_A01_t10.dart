// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration can have metadata attached to it.
///
/// @description Check that augmenting metadata is appended to the introductory
/// declaration (not replaces it). Test class-like declarations.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import 'dart:mirrors';
import '../../Utils/expect.dart';

class Meta1 {
  const Meta1();
}

class Meta2 {
  const Meta2();
}

var expected = [Symbol('.Meta1'), Symbol('.Meta2')];

@Meta1()
class C {}

@Meta2()
augment class C {}

@Meta1()
mixin M {}

@Meta2()
augment mixin M {}

@Meta1()
enum E {
  e0;
}

@Meta2()
augment enum E {
  ;
}

class A {}

@Meta1()
extension Ext on A {}

@Meta2()
augment extension Ext {}

@Meta1()
extension type ET(int id) {}

@Meta2()
augment extension type ET {}

main() {
  Expect.isTrue(
      expected.contains(reflectClass(C).metadata[0].type.qualifiedName));
  Expect.isTrue(
      expected.contains(reflectClass(C).metadata[1].type.qualifiedName));
  Expect.isTrue(
      expected.contains(reflectClass(M).metadata[0].type.qualifiedName));
  Expect.isTrue(
      expected.contains(reflectClass(M).metadata[1].type.qualifiedName));
  Expect.isTrue(
      expected.contains(reflectClass(E).metadata[0].type.qualifiedName));
  Expect.isTrue(
      expected.contains(reflectClass(E).metadata[1].type.qualifiedName));
  // Extensions and extension types cannot be reflected therefore it is not
  // possible to check their metadata.
}
