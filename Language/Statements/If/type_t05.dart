/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An if statement of the form if (b) s1 else s2.
 * If:
 * • b shows that a variable v has type T .
 * • v is not potentially mutated in s1 or within a closure.
 * • If the variable v is accessed by a closure in s1 then the variable v is
 *   not potentially mutated anywhere in the scope of v.
 * Then the type of v is known to be T in s1.
 * @description Checks that if b shows that v has type T, v is not potentially
 * mutated in s1 or within a closure, and there is no closure capturing v in s1,
 * then the type of v is known to be T in s1, even if v is potentially mutated
 * elsewhere in its scope.
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
  closure () => x;

  if (x is D) {
    closure();
    (() => y) ();
    x.f();
  } else
    x = new C();
}

// local variable
f2(C z) {
  C x = z;
  var y;
  closure () => x;

  if (x is D) {
    closure();
    (() => y) ();
    x.f();
  } else
    x = new C();
}

main() {
  f1(new D());
  f2(new D());
}
