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
/// declaration. Test classes, mixins, etc.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'metadata_A01_t09_lib.dart';
import 'dart:mirrors';
import '../../Utils/expect.dart';

class Meta {
  const Meta();
}

class C {}

mixin M {}

enum E {
  e0;
}

class A {}

extension Ext on A {}

extension type ET(int id) {}

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
