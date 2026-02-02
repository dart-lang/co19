// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration can have metadata attached to it.
///
/// @description Check that augmenting metadata is appended to the introductory
/// declaration. Test variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

library metadata_A01_t01;

import 'dart:mirrors';
import '../../Utils/expect.dart';
part 'metadata_A01_t01_lib.dart';

class Meta {
  const Meta();
}

String topLevelVariable = "Top-level variable";

class C {
  static String staticVariable = "Static variable";
  String instanceVariable = "Instance variable";
}

mixin M {
  static String staticVariable = "Static variable";
  String instanceVariable = "Instance variable";
}

enum E {
  e0;

  static String staticVariable = "Static variable";
  final String instanceVariable = "Instance variable";
}

class A {}

extension Ext on A {
  static String staticVariable = "Static variable";
}

extension type ET(int instanceVariable) {
  static String staticVariable = "Static variable";
}

main() {
  LibraryMirror libraryMirror = currentMirrorSystem().findLibrary(
    #metadata_A01_t01,
  );
  var symbol = MirrorSystem.getSymbol("topLevelVariable");
  DeclarationMirror varMirror =
      libraryMirror.declarations[symbol] as DeclarationMirror;
  Expect.equals(
    'metadata_A01_t01.Meta',
    MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName),
  );

  testType(C);
  testType(M);
  testType(E);
  // Extensions and extension types cannot be reflected therefore it is not
  // possible to check their metadata.
}

void testType(Type t) {
  ClassMirror classMirror = reflectClass(t);
  var varNames = ['staticVariable', 'instanceVariable'];
  for (var name in varNames) {
    Symbol symbol = MirrorSystem.getSymbol(name);
    DeclarationMirror varMirror =
        classMirror.declarations[symbol] as DeclarationMirror;
    Expect.equals(
      'metadata_A01_t01.Meta',
      MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName),
    );
  }
}
