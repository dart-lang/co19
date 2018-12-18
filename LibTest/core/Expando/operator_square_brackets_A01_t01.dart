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
 * @description Checks that the object must not be a number, a string, a boolean
 * or null.
 * @author rodionov
 */
import "../../../Utils/expect.dart";

main() {
  Expando exp = new Expando("exp");
  var o1 = 4;
  var o2 = "";
  var o3 = true;
  var o4 = null;
  Expect.throws(() => exp[o1]);
  Expect.throws(() => exp[o2]);
  Expect.throws(() => exp[o3]);
  Expect.throws(() => exp[o4]);
}
