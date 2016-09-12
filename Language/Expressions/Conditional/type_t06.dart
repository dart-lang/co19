/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A conditional expression c of the form e1 ? e2 : e3.
 * If all of the following hold:
 * • e1 shows that a variable v has type T.
 * • v is not potentially mutated in e2 or within a closure.
 * • If the variable v is accessed by a closure in e2 then the variable v is
 *   not potentially mutated anywhere in the scope of v .
 * then the type of v is known to be T in e2.
 * @description Checks that if e1 does not show that v has any type T, then the
 * type of v is not known to be any promoted type in e2.
 * @author ilya
 */

class C {}
class D extends C {
  f() {}
}
class E extends C {
  f() {}
}

f(var x) {
  (x is D || x is E) ? x.f() : null;
}

main() {
  f(new D());
}
