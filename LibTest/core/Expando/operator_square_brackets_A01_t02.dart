/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T operator [](Object object)
 * Gets the value of this Expando's property on the given object. If the object
 * hasn't been expanded, the method returns null.
 * The object must not be a number, a string, a boolean or null.
 * @description Checks that this operator returns null for a freshly expanded
 * object(s).
 * @author rodionov
 */
import "../../../Utils/expect.dart";

class A {}
class B extends A {}

main() {
  Expando exp = new Expando("exp");
  var o1 = new Object();
  var o2 = new A();
  var o3 = new B();
  Expect.isNull(exp[o1]);
  Expect.isNull(exp[o2]);
  Expect.isNull(exp[o3]);
}
