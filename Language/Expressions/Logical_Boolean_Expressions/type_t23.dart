/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A logical boolean expression b of the form e1 && e2 shows that a
 * variable v has type T if all of the following conditions hold:
 * • Either e1 shows that v has type T or e2 shows that v has type T.
 * • v is a local variable or formal parameter.
 * • The variable v is not mutated in e2 or within a closure.
 * Furthermore, if all of the following hold:
 * • e1 shows that v has type T.
 * • v is not mutated in either e1 , e2 or within a closure.
 * • If the variable v is accessed by a closure in e2 then the variable v is not
 *   potentially mutated anywhere in the scope of v.
 * then the type of v is known to be T in e2.
 * @description Checks that if v is local variable or formal parameter,
 * e1 shows that v has type T, v is not mutated anywhere in its scope,
 * then the type of v is known to be T in e2, regardless of whether there are
 * closures capturing v.
 * @author ilya
 */

class C {}

class D extends C {
  f() {}
}

skyIsBlue(_) => true;

// formal parameter
f1(var x) {
  x is D && x.f() == null;
  (x is D && x.f() == null) && x.f() == null;
}

// formal parameter & closures
f2(var x) {
  x is D && skyIsBlue([x.f() == null, (() => x)()]);
  (x is D && skyIsBlue([x.f() == null, (() => x)()])) && x.f() == null;
}

// local variable
f3(var y) {
  C x = y;

  x is D && x.f() == null;
  (x is D && x.f() == null) && x.f() == null;
}

// local variable & closures
f4(var y) {
  C x = y;
  x is D && skyIsBlue([x.f() == null, (() => x)()]);
  (x is D && skyIsBlue([x.f() == null, (() => x)()])) && x.f() == null;
}

main() {
  f1(new D());
  f2(new D());
  f3(new D());
  f4(new D());
}
