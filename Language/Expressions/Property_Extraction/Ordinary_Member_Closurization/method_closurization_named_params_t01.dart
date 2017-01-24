/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let o be an object, and let u be a fresh final variable bound
 * to o. The closurization of method f on object o is defined to be equivalent
 * to:
 * ...
 * • (r1, . . . , rn , {p1 : d1, . . . , pk : dk }) {
 * return u.m(r1, . . . , rn, p1 : p1, . . . , pk : pk );
 * }
 * if f is named m and has required parameters r1, . . . , rn , and named
 * parameters p1 , . . . , pk with defaults d1, . . . , dk.
 *
 * @description Check that closurization of method
 * m(r1, . . . , rn, p1 : p1, . . . , pk : pk ) on object o is
 * equivalent to (r1, . . . , rn , {p1 : d1, . . . , pk : dk }) {
 * return u.m(r1, . . . , rn, p1 : p1, . . . , pk : pk );
 * }
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  double m(int r1, int r2, double r3, {p1: 2, p2: -3, p3: -7}) {
    return r1 * r2 * r3 * p1 * p2 * p3;
  }
}

main() {
  C o = new C();
  var f = o.m;

  var f1 = (int r1, int r2, double r3, {p1: 2, p2: -3, p3: -7}) {
    return o.m(r1, r2, r3, p1: p1, p2: p2, p3: p3);
  };

  Expect.equals(f(1, 2, 3.0, p1: 4, p2: 5, p3: 6), f1(1, 2, 3.0, p1: 4, p2: 5, p3: 6));
  Expect.equals(f(2, 3, 8.5), f1(2, 3, 8.5));
  Expect.equals(f(-1, 3, 9.1, p1: 4), f1(-1, 3, 9.1, p1: 4));
  Expect.equals(f(-1, 3, 9.1, p2: 4), f1(-1, 3, 9.1, p2: 4));
  Expect.equals(f(-1, 3, 9.1, p3: 4), f1(-1, 3, 9.1, p3: 4));
}
