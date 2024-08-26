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
/// declaration. Test setters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros
library metadata_A01_t05;

import augment 'metadata_A01_t05_lib.dart';
import 'dart:mirrors';
import '../../Utils/expect.dart';

class Meta {
  const Meta();
}

void set topLevelSetter(String _) {}

class C {
  static void set staticSetter(String _) {}
  void set instanceSetter(String _) {}
}

mixin M {
  static void set staticSetter(String _) {}
  void set instanceSetter(String _) {}
}

enum E {
  e0;
  static void set staticSetter(String _) {}
  void set instanceSetter(String _) {}
}

class A {}

extension Ext on A {
  static void set staticSetter(String _) {}
  void set instanceSetter(String _) {}
}

extension type ET(int id) {
  static void set staticSetter(String _) {}
  void set instanceSetter(String _) {}
}

main() {
  Symbol libName = MirrorSystem.getSymbol('metadata_A01_t05');
  LibraryMirror libraryMirror = currentMirrorSystem().findLibrary(libName);
  var symbol = MirrorSystem .getSymbol("topLevelSetter=");
  DeclarationMirror varMirror =
    libraryMirror.declarations[symbol] as DeclarationMirror;
  Expect.equals('.Meta',
      MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName));

  testType(C);
  testType(M);
  testType(E);
  // Extensions and extension types cannot be reflected therefore it is not
  // possible to check their metadata.
}

void testType(Type t) {
  ClassMirror classMirror = reflectClass(t);
  var varNames = ['staticSetter=', 'instanceSetter='];
  for (var name in varNames) {
    Symbol symbol = MirrorSystem .getSymbol(name);
    DeclarationMirror varMirror =
        classMirror.declarations[symbol] as DeclarationMirror;
    Expect.equals('.Meta',
        MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName));
  }
}
