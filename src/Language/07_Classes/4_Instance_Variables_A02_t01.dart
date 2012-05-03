/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An instance variable declaration of one of the forms
 * T v;, final T v; , T v = e;, const T v = e;  or final T v = e;
 * always induces an implicit getter function with signature T get v()
 * whose  invocation evaluates to the value stored in v.
 * @description Trivially checks that instance variables declared as in assertion are accessible.
 * @author vasya
 * @reviewer pagolubev
 * @reviewer iefremov
 */

class C {
  C(this.v2);
  bool v1;
  final bool v2;
  String v3 = "bar";
  final int v4 = 1;
  const double x = 1.1;
}

main() {
  C c = new C(false);
  Expect.equals(null, c.v1);
  Expect.equals(false, c.v2);
  Expect.equals("bar", c.v3);
  Expect.equals(1, c.v4);
  Expect.equals(1.2, c.x);
}
