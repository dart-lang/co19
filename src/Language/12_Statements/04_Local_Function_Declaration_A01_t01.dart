/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function declaration statement declares a new local function.
 *   localFunctionDeclaration:
 *     functionSignature functionBody
 *   ;
 * functionSignature:
 *   metadata returnType? identifier formalParameterList
 * ;
 * returnType: void | type
 * ;
 * functionBody:
 *   '=>' expression ';' | block
 * ;
 * block:
 *   '{' statements '}'
 * ;
 * @description Checks that various correct function definitions are accepted.
 * @author kaigorodov
 */

main() {
  void func() {}
  void f(void f()) {}
  x() => f(f);

  int f2(int x) {throw '';}
  func1(var x) {}
  func2(var x, [var y=0]) {return x+y;}
  func3(var x, {var y:1}) {return x*y;}
  Object obj() => null;

  fgh(g(h())){}
  int func4([int x = null, int y = null, int z = null]) {f(f(x()));}
  int foo(Object x, var y) => func(1, 2, 3);
}

