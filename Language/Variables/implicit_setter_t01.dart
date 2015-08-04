/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A non-final variable declaration of the form var v;
 * or the form var v = e; always induces an implicit setter function 
 * with signature
 *   set v = (x)
 * whose execution sets the value of v to the incoming argument x.
 * @description Trivially checks that some arbitrary values may be assigned
 * to the variables declared as in assertion.
 * @static-clean
 * @author vasya
 * @reviewer pagolubev
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

class C {
  var foo;
  var bar = "bar";
}

main() {
  C c = new C();

  c.foo = "foo";
  Expect.equals("foo", c.foo);

  c.bar = "bar2";
  Expect.equals("bar2", c.bar);
}
