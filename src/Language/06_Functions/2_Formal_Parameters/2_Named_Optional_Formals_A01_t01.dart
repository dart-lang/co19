/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Optional parameters may be specified and provided with default values.
 *  defaultFormalParameter:
 *   normalFormalParameter ('=' expression)?
 *  ;
 * @description Checks that optional parameters can be provided with default values
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer iefremov
 */

void f([bool b = true, int x = 1]) {}
void g(var x, [var y = 1]) {}
void h([var x, var y = true, var z]) {}
void i([a = const [const []]]){}
void j([m = const {"foo":"bar", "boo" : const [], "zoo" : const{"x":"y"}}]){}
void x([f([p, v, a]) = null]) {}

void f_func([void func(var p) = null]) {}
void f_undeclared([u = 1]) {}

main() {
  f();
  f(false);
  g(1, 2);
  h(x:3);
  i();
  j();
  x();

  f_func();
  f_undeclared();
}