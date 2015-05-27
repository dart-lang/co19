/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A library consists of (a possibly empty) set of imports, asset of exports, and a set of top level
 * declarations. A top level declaration is either a class, a type alias declaration, a function 
 * or a variable declaration.
 * topLevelDefinition:
 * classDefinition |
 * typeAlias |
 * external? functionSignature |
 * external? getterSignature |
 * external? setterSignature |
 * functionSignature functionBody |
 * returnType? getOrSet identifier formalParameterList function-Body |
 * (final | const) type? staticFinalDeclarationList ';' |
 * variableDeclaration ';'
 * ;
 * getOrSet:
 * get |
 * set
 * ;.
 * @description Checks that a library containing correct top level definitions
 * is parsed without errors.
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 */

import "13_Libraries_and_Scripts_A01_t01_lib.dart";

main() {
  new A();
  new B();
  new C();
  new D();

  f();
  g(1, 2);
  h('', "");

  typeF funcF = ()=>1;
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
}
