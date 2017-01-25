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
 * • (r1, . . . , rn , [p1 = d1, . . . , pk = dk]) {
 * return u.m(r1, . . . , rn , p1, . . . , pk );
 * }
 * if f is named m and has required parameters r 1 , . . . , r n , and optional
 * positional parameters p1, . . . , pk with defaults d1, . . . , dk.
 *
 * @description Check that closurization of method
 * m(r1, . . . , rn , [p1 = d1, . . . , pk = dk]) on object o is
 * equivalent to (r1, . . . , rn , [p1 = d1, . . . , pk = dk]) {
 * return u.m(r1, . . . , rn , p1, . . . , pk );
 * }
 * Test the case when m calls another method
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class C {
  double n(int r1, int r2, double r3, p1, p2, p3) {
    return r1 * r2 * r3 * p1 * p2 * p3;
  }

  int sum(a, b) => a + b;

  double m(int r1, int r2, double r3, [p1 = 2, p2 = -3, p3 = -7]) {
    return sum(r1, p1) * n(r1, r2, r3, p1, p2, p3);
  }
}

main() {
  C o = new C();
  var f = o.m;

  var f1 = (int r1, int r2, double r3, [p1 = 2, p2 = -3, p3 = -7]) {
    return o.m(r1, r2, r3, p1, p2, p3);
  };

  Expect.equals(f(1, 2, 3.2, 4, 5, 6), f1(1, 2, 3.2, 4, 5, 6));
  Expect.equals(f(2, 3, 8.5), f1(2, 3, 8.5));
  Expect.equals(f(-1, 3, 9.1, 4), f1(-1, 3, 9.1, 4));
  Expect.equals(f(-1, 3, 9.1, 4, 5), f1(-1, 3, 9.1, 4, 5));
}
