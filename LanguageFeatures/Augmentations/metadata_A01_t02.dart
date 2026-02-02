// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration can have metadata attached to it.
///
/// @description Check that augmenting metadata is appended to the introductory
/// declaration (does not replace it). Test variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

library metadata_A01_t02;

import 'dart:mirrors';
import '../../Utils/expect.dart';
part 'metadata_A01_t02_lib.dart';

class Meta1 {
  const Meta1();
}

class Meta2 {
  const Meta2();
}

var expected = ['metadata_A01_t02.Meta1', 'metadata_A01_t02.Meta2'];

@Meta1()
String topLevelVariable = "Top-level variable";

class C {
  @Meta1()
  static String staticVariable = "Static variable";
  @Meta1()
  String instanceVariable = "Instance variable";
}

mixin M {
  @Meta1()
  static String staticVariable = "Static variable";
  @Meta1()
  String instanceVariable = "Instance variable";
}

enum E {
  e0;

  @Meta1()
  static String staticVariable = "Static variable";
  @Meta1()
  final String instanceVariable = "Instance variable";
}

class A {}

extension Ext on A {
  @Meta1()
  static String staticVariable = "Static variable";
}

extension type ET(int instanceVariable) {
  @Meta1()
  static String staticVariable = "Static variable";
}

main() {
  LibraryMirror libraryMirror = currentMirrorSystem().findLibrary(
    #metadata_A01_t02,
  );
  var symbol = MirrorSystem.getSymbol("topLevelVariable");
  DeclarationMirror varMirror =
      libraryMirror.declarations[symbol] as DeclarationMirror;
  Expect.isTrue(
    expected.contains(
      MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName),
    ),
  );
  Expect.isTrue(
    expected.contains(
      MirrorSystem.getName(varMirror.metadata[1].type.qualifiedName),
    ),
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
    Expect.isTrue(
      expected.contains(
        MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName),
      ),
    );
    Expect.isTrue(
      expected.contains(
        MirrorSystem.getName(varMirror.metadata[1].type.qualifiedName),
      ),
    );
  }
}
