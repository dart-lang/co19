// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A library consists of (a possibly empty) set of imports, a set
/// of exports, and a set of top level declarations. A top level declaration
/// is either a class, a type alias declaration, a function or a variable
/// declaration. The members of a library L are those top level declarations
/// given within L.
/// topLevelDefinition:
///   classDefinition |
///   enumType |
///   typeAlias |
///   external? functionSignature ';' |
///   external? getterSignature ';' |
///   external? setterSignature ';' |
///   functionSignature functionBody |
///   returnType? get identifier functionBody |
///   returnType? set identifier formalParameterList functionBody |
///   (final | const) type? staticFinalDeclarationList ';' |
///   variableDeclaration ';'
/// ;
/// @description Checks that a library containing correct top level non-function
/// type alias definitions is parsed without errors.
/// @author iarkh


import "top_level_syntax_t20_lib.dart";

main() {
  AAlias a = AAlias();
  BAlias b = BAlias();

  CAlias1 c1 = CAlias1();
  CAlias1<String> c2 = CAlias1<String>();

  CAlias2 c3 = CAlias2();
  CAlias2<num> c4 = CAlias2();
  CAlias2<int> c5 = C<int>();
  C<int> c6 = CAlias2<int>();
  CAlias2<double> c7 = CAlias2<double>();
}
