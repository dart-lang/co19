// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All declarations can be augmented with metadata annotations
/// and/or doc comments directly preceding an augmenting declaration.
///
/// In both cases, these should be appended to existing metadata or doc
/// comments. For metadata annotations, these may trigger additional macro
/// applications.
///
/// @description Check that augmenting metadata is appended to the introductory
/// declaration (not replaces it). Test classes, mixins, etc.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import 'dart:mirrors';
import '../../Utils/expect.dart';
part 'metadata_A01_t10_lib.dart';

class Meta1 {
  const Meta1();
}

class Meta2 {
  const Meta2();
}

var expected = [Symbol('.Meta1'), Symbol('.Meta2')];

@Meta1()
class C {}

@Meta1()
mixin M {}

@Meta1()
enum E {
  e0;
}

class A {}

@Meta1()
extension Ext on A {}

@Meta1()
extension type ET(int id) {}

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
