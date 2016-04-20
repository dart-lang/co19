/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Optional parameters may be specified and provided with default
 * values.
 * defaultFormalParameter:
 *   normalFormalParameter ('=' expression)?
 * ;
 * defaultNamedParameter:
 *   normalFormalParameter (':' expression)?
 * ;
 * @description Checks that optional parameters can be provided with default
 * values
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer iefremov
 * @reviewer rodionov
 */

void f([bool b = true, int x = 1]) {}
void g(var x, [var y = 1]) {}
void h([var x, var y = true, var z]) {}
void i([var a = const [const []]]) {}
void j([
  var m = const {"foo": "bar", "boo": const [], "zoo": const{"x": "y"}}
]) {}
void k([func([int p, int v, int a]) = null]) {}

void f2({bool b: true, int x: 1}) {}
void g2(var x, {var y: 1}) {}
void h2({var x, var y: true, var z}) {}
void i2({a: const [const []]}) {}
void j2({m: const {"foo": "bar", "boo": const [], "zoo": const{"x": "y"}}}) {}
void k2({func([int p, int v, int a]): null}) {}

void f_func([void func(var p) = null]) {}
void f_undeclared([var u = 1]) {}

void f_func2({void func(var p): null}) {}
void f_undeclared2({var u: 1}) {}

main() {
  f();
  f(false);
  g(1, 2);
  h(3);
  i();
  j();
  k();

  f_func();
  f_undeclared();

  f2();
  f2(b: false);
  f2(x: 2);
  f2(x: 3, b: false);
  g2(1);
  g2(1, y: 2);
  h2();
  h2(x: 3);
  h2(y: 3);
  h2(z: 3);
  i2();
  j2();
  k2();

  f_func2();
  f_undeclared2();
}
