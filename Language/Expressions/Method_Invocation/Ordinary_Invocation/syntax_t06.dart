/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unconditional ordinary method invocation i has the form
 * o.m(a1, ..., an, xn+1 : an+1, ..., xn+k : an+k).
 * where C denotes a class in the current scope.
 * @description Checks that static invocations (when o denotes a class in the
 * current scope), which matching the production, don't cause compile-time
 * errors.
 * @author msyabro
 * @reviewer kaigorodov
 */

class C {
  static f1() {}
  static f2(p1, p2, p3) {}
  static f3([name1, name2]) {}
  static f4(p1, [name]) {}
  static f5(p1, p2, {name1, name2}) {}
  static f6(p1, p2, p3, p4, {name1, name2}) {}
}

main() {
  C.f1();

  C.f2(1 * 1, 1 / 1, 1 < 1);
  C.f2(new Object(), true, false);

  C.f3();
  C.f3(1);
  C.f3(1, "");
  C.f4(1);
  C.f4(1, 1);
  C.f5(null, null);
  C.f5(null, null, name2: null);
  C.f5(null, null, name1: null, name2: null);
  C.f6(() {}, () {return true;}, {}, [],
      name1: (x) => x + 1, name2: (y) => (z) => z - y);

}
