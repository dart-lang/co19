/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If o is an object, and if m is the name of a method
 * member of o, then o.m is defined to be equivalent to
 * (r1, ... , rn, [p1 = d1, ... , pk = dk]){return o.m(r1, ... , rn, p1, ... , pk);}
 * if m has required parameters r1, ... , rn, and named parameters p1, ... , pk
 * with defaults d1, ... , dk.
 * @description Checks that if m is a method, o.m is defined to be equivalent to
 * (r1, ... , rn, [p1 = d1, ... , pk = dk]){return o.m(r1, ... , rn, p1, ... , pk);}
 * @author msyabro
 * @reviewer kaigorodov
 */

class C {
  m1(p1, p2, [p3 = 3, p4 = 4]) {
    return p1 * p2 - p4 + p3;
  }
  m2(p1) {
    return p1.toString();
  }
  m3([p1, p2]) {
    return '$p1$p2';
  }
}

main() {
  var o = new C();
  var f1 = o.m1;
  var f2 = (p1, p2, [p3 = 3, p4 = 4]) {return o.m1(p1, p2, p3, p4);};
  Expect.equals(f2(1, 2, p4: 5), f1(1, 2, p4: 5));

  f1 = o.m2;
  f2 = (p1) {return o.m2(p1);};
  Expect.equals(f2(1), f1(1));

  f1 = o.m3;
  f2 = ([p1, p2]) {return o.m3(p1, p2);};
  Expect.equals(f2("a", "b"), f1("a", "b"));
}

