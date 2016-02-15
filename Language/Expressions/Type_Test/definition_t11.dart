/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let v be a local variable or a formal parameter. An is-expression
 * of the form v is T shows that v has type T iff T is more specific than the
 * type S of the expression v and both T != dynamic and S != dynamic.
 * @description Checks that if T is more specific than S, and neither of them
 * is dynamic, then is-expression shows that v has type T. Nested case.
 * @static-clean
 * @author ilya
 */

class C {}
class D extends C { f() {} }
class E extends D { g() {} }

f(C x) {
  C y = x;

  // formal parameter
  if (x is D)
    if (x is E)
      x.g();
    else
      x.f();

  // local variable
  if (y is D)
    if (y is E)
      y.g();
    else
      y.f();
}

main() {
  f(new D());
  f(new E());
}
