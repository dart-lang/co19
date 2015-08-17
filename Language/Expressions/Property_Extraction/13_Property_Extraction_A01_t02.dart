/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e is an expression that evaluates to an object o, and if m is
 * the name of a concrete method member of e, then e.m is dened to be equivalent to:
 * - (r1, ..., rn, {p1:d1, ..., pk:dk }){return u.m(r1, ..., rn, p1:p1, ..., pk:
 *   pk); } if m has required parameters r1, ..., rn, and named parameters
 *   p1, ..., pk with defaults d1, ..., dk.
 * - (r1, ..., rn, [p1=d1, ..., pk=dk ]){return u.m(r1, ..., rn, p1, ..., pk ); } if
 *   m has required parameters r1, ..., rn, and optional positional parameters
 *   p1, ..., pk with defaults d1, ..., dk .
 * where u is a fresh final variable bound to o, except that:
 * 1. iff identical(o1,o2) then o1.m == o2.m.
 * 2. The static type of the property extraction is the static type of function
 * T.m, where T is the static type of e, if T.m is defined. Otherwise the
 * static type of e.m is dynamic.
 * @description Checks that property extraction returns equal results for
 * identical() objects and not equal results for not identical() objects.
 * @author ilya
 */
import '../../../Utils/expect.dart';

class C {
  f(x) => ++x;
}

class D {
  const D();
  g() {}
}

main() {
  var x = new C();
  var y = new C();

  Expect.equals(x.f, x.f);
  Expect.notEquals(x.f, y.f);
  
  Expect.equals(const D().g, const D().g);
  Expect.notEquals(new D().g, new D().g);
}