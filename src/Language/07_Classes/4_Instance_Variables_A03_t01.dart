/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An instance variable declaration of one of the forms
 * var v;, final v;, var v = e;, const  v = e; or final v = e;
 * always induces an implicit getter function with signature get v()
 * whose  invocation evaluates to the value stored in v.
 * @description Trivially checks that instance variables declared as in
 * assertion are accessible.
 * @author vasya
 * @reviewer pagolubev
 * @reviewer iefremov
 */

class C {
  C(this.v4);
  var v1;
  var v2 = "bar";
  final v3 = 1;
  final v4;
  const v5 = 0.2;
}

main() {
  C c = new C(3);
  Expect.equals(null, c.v1);
  Expect.equals("bar", c.v2);
  Expect.equals(1, c.v3);
  Expect.equals(3, c.v4);
  Expect.equals(0.2, c.v5);
}
