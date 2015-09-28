/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration of one of the forms
 * T v;, T v = e; , const T v = e;, final T v; or final T v = e;
 * always induces an implicit getter function with signature
 *   T get v
 * whose invocation evaluates as described below.
 * @description Trivially checks that instance variables declared with 
 * specified type are accessible.
 * @author vasya
 * @reviewer pagolubev
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

class C {
  C(this.v2);
  bool v1;
  final bool v2;
  String v3 = "bar";
  final int v4 = 1;
  var x = 1.1;
}

main() {
  C c = new C(false);
  Expect.equals(null, c.v1);
  Expect.equals(false, c.v2);
  Expect.equals("bar", c.v3);
  Expect.equals(1, c.v4);
  Expect.equals(1.1, c.x);
}
