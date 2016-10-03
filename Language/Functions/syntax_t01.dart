/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Functions include function declarations, methods, getters,
 * setters, constructors and function literals.
 * All functions have a signature and a body.
 * functionSignature:
 *   metadata returnType? identifier formalParameterList
 * ;
 * returnType: void | type
 * ;
 * functionBody:
 *   async? '=>' expression ';' | (async | async* | sync*)? block
 * ;
 * block:
 *   '{' statements '}'
 * ;
 * @description Checks different variants of functions
 * @author msyabro
 * @reviewer kaigorodov
 */

void func() {}
void f(void f()) {}
x() => f(func);

class A {
  A() {}
  A.x() {}

  int f(int x) {throw '';}
  A func(var x) {}
  Object obj() => null;

  int _val;
  set val(int v) => v;
  get val => _val;

  String _s;
  set s(String str) {str = _s; _s = str;}
  Object get s {Object a = new Object(); return 5;}
}

main() {
  f(g(h())) {}
  int func([int x = null, int y = null, int z = null]) => 3;
  int foo(Object x, var y) => func(1, 2, 3);
}
