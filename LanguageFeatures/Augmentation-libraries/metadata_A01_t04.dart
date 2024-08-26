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
/// declaration (not replaces it). Test getters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros
library metadata_A01_t04;

import augment 'metadata_A01_t04_lib.dart';
import 'dart:mirrors';
import '../../Utils/expect.dart';

class Meta1 {
  const Meta1();
}

class Meta2 {
  const Meta2();
}

@Meta1()
String get topLevelGetter => "Top-level getter";

class C {
  @Meta1()
  static String get staticGetter => "Static getter";
  @Meta1()
  String get instanceGetter => "Instance getter";
}

mixin M {
  @Meta1()
  static String get staticGetter => "Static getter";
  @Meta1()
  String get instanceGetter => "Instance getter";
}

enum E {
  e0;
  @Meta1()
  static String get staticGetter => "Static getter";
  @Meta1()
  String get instanceGetter => "Instance getter";
}

class A {}

extension Ext on A {
  @Meta1()
  static String get staticGetter => "Static getter";
  @Meta1()
  String get instanceGetter => "Instance getter";
}

extension type ET(int id) {
  @Meta1()
  static String get staticGetter => "Static getter";
  @Meta1()
  String get instanceGetter => "Instance getter";
}

main() {
  Symbol libName = MirrorSystem.getSymbol('metadata_A01_t04');
  LibraryMirror libraryMirror = currentMirrorSystem().findLibrary(libName);
  var symbol = MirrorSystem .getSymbol("topLevelGetter");
  DeclarationMirror varMirror =
    libraryMirror.declarations[symbol] as DeclarationMirror;
  Expect.equals('.Meta1',
      MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName));
  Expect.equals('.Meta2',
      MirrorSystem.getName(varMirror.metadata[1].type.qualifiedName));

  testType(C);
  testType(M);
  testType(E);
  // Extensions and extension types cannot be reflected therefore it is not
  // possible to check their metadata.
}

void testType(Type t) {
  ClassMirror classMirror = reflectClass(t);
  var varNames = ['staticGetter', 'instanceGetter'];
  for (var name in varNames) {
    Symbol symbol = MirrorSystem .getSymbol(name);
    DeclarationMirror varMirror =
        classMirror.declarations[symbol] as DeclarationMirror;
    Expect.equals('.Meta1',
        MirrorSystem.getName(varMirror.metadata[0].type.qualifiedName));
    Expect.equals('.Meta2',
        MirrorSystem.getName(varMirror.metadata[1].type.qualifiedName));
  }
}
