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
 * @description Checks that if m is a method, o.m is defined to be equivalent to
 * (r1, ..., rn, [p1 = d1, ..., pk = dk]){return u.m(r1, ..., rn, p1, ..., pk);}
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

class C {
  m1(p1) {
    return p1.toString();
  }
  m2({p1, p2}) {
    return '$p1$p2';
  }
  m3(p1, p2, {p3:3, p4:4}) {
    return p1 * p2 - p4 + p3;
  }
  m4([p1, p2]) {
    return '$p1$p2';
  }
  m5(p1, p2, [p3=3, p4=4]) {
    return p1 * p2 + p4 * p3;
  }
}

main() {
  var o = new C();
  
  var f1 = o.m1;
  var f2 = (p1) {return o.m1(p1);};
  Expect.equals(f2(1), f1(1));

  f1 = o.m2;
  f2 = ({p1, p2}) {return o.m2(p1:p1, p2:p2);};
  Expect.equals(f2(p1:"a", p2:"b"), f1(p1:"a", p2:"b"));

  f1 = o.m3;
  f2 = (p1, p2, {p3:3, p4:4}) {return o.m3(p1, p2, p3:p3, p4:p4);};
  Expect.equals(f2(1, 2, p4:5), f1(1, 2, p4:5));

  f1 = o.m4;
  f2 = ([p1, p2]) {return o.m4(p1, p2);};
  Expect.equals(f2("a", "b"), f1("a", "b"));

  f1 = o.m5;
  f2 = (p1, p2, [p3 = 3, p4 = 4]) {return o.m5(p1, p2, p3, p4);};
  Expect.equals(f2(1, 2, 3, 5), f1(1, 2, 3, 5));
}
