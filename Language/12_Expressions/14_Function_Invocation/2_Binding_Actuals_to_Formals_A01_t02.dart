/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Checks that actual parameters are bound correctly.
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

f(p1, p2, {p3, p4: 0}) {
  Expect.equals(1, p1);
  Expect.equals(2, p2);
  Expect.equals(3, p3);
  Expect.equals(4, p4);
}

g(p1, p2, p3, p4, p5, p6) {
  Expect.equals("s", p1);
  Expect.equals("t", p2);
  Expect.equals("r", p3);
  Expect.equals("i", p4);
  Expect.equals("n", p5);
  Expect.equals("g", p6);
}

h(name1, [name2 = null, name3]) {
  Expect.equals(true, name1);
  Expect.equals(false, name2);
  Expect.equals(0, name3);
}

main() {
  f(1, 2, p4: 4, p3: 3);
  g("s", "t", "r", "i", "n", "g");
  h(true, false, 0);
}
