/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A script is a library with a top level function main().
 * scriptDefinition:
 * scriptTag? libraryName? import* include* resource* topLevelDefinition*
 * ;
 * topLevelDefinition:
 *     classDefinition
 *   | interfaceDefinition
 *   | functionTypeAlias
 *   | functionSignature functionBody
 *   | returnType? getOrSet identifier formalParameterList functionBody
 *   | final type? staticFinalDeclarationList ';'
 *   | variableDeclaration ';'
 * ;
 * getOrSet:
 *   get
 *   | set
 * ;
 * @description Checks that a script with valid top level definitions is parsed
 * without errors.
 * @author msyabro
 * @reviewer rodionov
 */

interface I {}
interface J<T> {}

class A {}
class B extends A {}
class C implements I {}
class D implements J<String> {}

f() {}
g(p1, p2) => p1 + p2;
A h([p1, p2]) {
  return new A();
}

typedef typeF();
typedef int typeG();
typedef void typeH(p1, p2);

final x = 'x';
String y = 'y';
var z;

int a, b, c = 1;

get _x {}
set _y(p) {}

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

  _x;
  _y = 1;
}
