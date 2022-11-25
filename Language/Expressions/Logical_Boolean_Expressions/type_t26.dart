// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A logical boolean expression b of the form e1 && e2 shows that a
/// variable v has type T if all of the following conditions hold:
/// • Either e1 shows that v has type T or e2 shows that v has type T.
/// • v is a local variable or formal parameter.
/// • The variable v is not mutated in e2 or within a closure.
/// Furthermore, if all of the following hold:
/// • e1 shows that v has type T.
/// • v is not mutated in either e1, e2 or within a closure.
/// • If the variable v is accessed by a closure in e2 then the variable v is not
///   potentially mutated anywhere in the scope of v.
/// then the type of v is known to be T in e2.
/// @description Checks that if v is local variable or formal parameter,
/// e1 shows that v has type T, but v is mutated in e1,
/// then the type of v is not known to be T in e2. Local variable case.
/// @author ilya


class C {}

class D extends C {
  f() {}
}

skyIsBlue(_) => true;

f(var y) {
  var x = y;
  (skyIsBlue([x = new C()]) && x is D) && x.f() == null;
}

main() {
  f(new D());
}
