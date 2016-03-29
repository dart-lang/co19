/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A library consists of (a possibly empty) set of imports, a set
 * of exports, and a set of top level declarations. A top level declaration
 * is either a class, a type alias declaration, a function or a variable
 * declaration. The members of a library L are those top level declarations
 * given within L.
 * topLevelDefinition:
 *   classDefinition |
 *   enumType |
 *   typeAlias |
 *   external? functionSignature ';' |
 *   external? getterSignature ';' |
 *   external? setterSignature ';' |
 *   functionSignature functionBody |
 *   returnType? get identifier functionBody |
 *   returnType? set identifier formalParameterList functionBody |
 *   (final | const) type? staticFinalDeclarationList ';' |
 *   variableDeclaration ';'
 * ;
 * @description Checks that a library containing correct top level definitions
 * is parsed without errors.
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 */

import "top_level_syntax_t01_lib.dart";

main() {
  new A();
  new B();
  new C();
  new D();

  f();
  g(1, 2);
  h('', "");

  typeF funcF = () => 1;
  typeG funcG = () {};
  typeH funcH = (p1, p2) {};

  x;
  y;
  z;
  a;
  b;
  c;

  getX;
  setY = 1;

  E.a;
  E.b;
  E.c;
}
