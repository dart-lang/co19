/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The closurization of method f with respect to superclass S is
 * defined to be equivalent to:
 * ...
 * • (r1, . . . , rn , {p1 : d1, . . . , pk : dk }) {
 * return super.m(r1, . . . , rn, p1 : p1, . . . , pk : pk );
 * }
 * if f is named m and has required parameters r1, . . . , rn , and named
 * parameters p1 , . . . , pk with defaults d1, . . . , dk.
 *
 * @description Check that closurization of method
 * m(r1, . . . , rn, p1 : p1, . . . , pk : pk ) on the superclass is
 * equivalent to (r1, . . . , rn , {p1 : d1, . . . , pk : dk }) {
 * return u.m(r1, . . . , rn, p1 : p1, . . . , pk : pk );
 * }
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  double m(int r1, int r2, double r3, {p1: 2, p2: -3, p3: -7}) {
    return r1 * r2 * r3 * p1 * p2 * p3;
  }
}

class C extends A {
  void test() {
    var f1 = super.m;
    var f2 = (int r1, int r2, double r3, {p1: 2, p2: -3, p3: -7}) {
      return super.m(r1, r2, r3, p1: p1, p2: p2, p3: p3);
    };

    Expect.equals(f1(1, 2, 3.1, p1: 4, p2: 5, p3: 6),
        f2(1, 2, 3.1, p1: 4, p2: 5, p3: 6));
    Expect.equals(f1(2, 3, 8.5), f2(2, 3, 8.5));
    Expect.equals(f1(-1, 3, 9.1, p1: 4), f2(-1, 3, 9.1, p1: 4));
    Expect.equals(f1(-1, 3, 9.1, p2: 4), f2(-1, 3, 9.1, p2: 4));
    Expect.equals(f1(-1, 3, 9.1, p3: 4), f2(-1, 3, 9.1, p3: 4));
  }
}

main() {
  C o = new C();
  o.test();
}
