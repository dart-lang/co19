/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A library consists of (a possibly empty) set of imports, and a set of top level
 * declarations. A top level declaration is either a class, an interface, a type
 * declaration, a function or a variable declaration.
 * topLevelDefinition:
 * classDefinition |
 * interfaceDefinition |
 * functionTypeAlias |
 * functionSignature functionBody |
 * returnType? getOrSet identifier formalParameterList function-Body |
 * final type? staticFinalDeclarationList ';' |
 * variableDeclaration ';'
 * ;
 * getOrSet:
 * get |
 * set
 * ;.
 * @description Checks that library containing correct top level definitions
 * is parsed without errors.
 * @author vasya
 * @reviewer msyabro
 */

#import("12_Libraries_and_Scripts_A01_t01_lib.dart");

main() {
  new A();
  new B();
  new C();
  new D();

  f();
  g(1, 2);
  h('', "");

  typeF funcF = () {};
  typeG funcG = int int_function() {};
  typeH funcH = void void_function (p1, p2) {};

  x;
  y;
  z;
  a;
  b;
  c;

  getX;
  setY = 1;
}
