// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration can have metadata attached to it.
///
/// @description Check that augmenting metadata is appended to the introductory
/// declaration. Test functions.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

library metadata_A01_t07;

import 'dart:mirrors';
import '../../Utils/expect.dart';
part 'metadata_A01_t07_lib.dart';

class Meta {
  const Meta();
}

void topLevelFunction() {}

class C {
  static void staticMethod() {}
  void instanceMethod() {}
}

mixin M {
  static void staticMethod() {}
  void instanceMethod() {}
}

enum E {
  e0;
  static void staticMethod() {}
  void instanceMethod() {}
}

class A {}

extension Ext on A {
  static void staticMethod() {}
  void instanceMethod() {}
}

extension type ET(int id) {
  static void staticMethod() {}
  void instanceMethod() {}
}

main() {
  Symbol libName = MirrorSystem.getSymbol('metadata_A01_t07');
  LibraryMirror libraryMirror = currentMirrorSystem().findLibrary(libName);
  var symbol = MirrorSystem .getSymbol("topLevelFunction");
  DeclarationMirror varMirror =
    libraryMirror.declarations[symbol] as DeclarationMirror;
  Expect.equals('metadata_A01_t07.Meta',
      MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName));

  testType(C);
  testType(M);
  testType(E);
  // Extensions and extension types cannot be reflected therefore it is not
  // possible to check their metadata.
}

void testType(Type t) {
  ClassMirror classMirror = reflectClass(t);
  var varNames = ['staticMethod', 'instanceMethod'];
  for (var name in varNames) {
    Symbol symbol = MirrorSystem .getSymbol(name);
    DeclarationMirror varMirror =
        classMirror.declarations[symbol] as DeclarationMirror;
    Expect.equals('metadata_A01_t07.Meta',
        MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName));
  }
}
