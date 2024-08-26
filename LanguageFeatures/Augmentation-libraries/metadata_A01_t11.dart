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
/// declaration. Test enum values.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'metadata_A01_t11_lib.dart';
import 'dart:mirrors';
import '../../Utils/expect.dart';

class Meta1 {
  const Meta1();
}

class Meta2 {
  const Meta2();
}

enum E {
  e0,
  @Meta1()
  e1;
}

main() {
  ClassMirror classMirror = reflectClass(E);
  Symbol symbol = MirrorSystem .getSymbol("e0");
  DeclarationMirror varMirror =
      classMirror.declarations[symbol] as DeclarationMirror;
  Expect.equals('.Meta1',
      MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName));

  symbol = MirrorSystem .getSymbol("e1");
  varMirror = classMirror.declarations[symbol] as DeclarationMirror;
  Expect.equals('.Meta1',
      MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName));
  Expect.equals('.Meta2',
      MirrorSystem.getName(varMirror.metadata[1].type.qualifiedName));
}
