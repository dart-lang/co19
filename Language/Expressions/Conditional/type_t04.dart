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
 * @description Checks that if e1 shows that v has type T, v is not potentially
 * mutated in e2 and not captured by any closure then the type of v is known to
 * be T in e2, even if v is potentially mutated elsewhere in its scope.
 * @static-clean
 * @author ilya
 */

class C {}
class D extends C {
  f() {}
}

// formal parameter
f1(C x) {
  var y;
  closure () => y=1;

  x is D ? [closure(), x.f()] : x = new C();
}

// local variable
f2(C z) {
  C x = z;
  var y;
  closure () => y=1;

  x is D ? [closure(), x.f()] : x = new C();
}

main() {
  f1(new D());
  f2(new D());
}
