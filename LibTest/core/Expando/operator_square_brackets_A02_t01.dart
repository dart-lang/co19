/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void operator []=(Object object, T value)
 * Sets the value of this Expando's property on the given object. Properties can
 * effectively be removed again by setting their value to null.
 * @description Checks that more than one Expando can be used with the same
 * argument object and they can all
 * be used simultaneously.
 * @author rodionov
 */
import "../../../Utils/expect.dart";

main() {
  var o = new Object();
  var exp = new Expando("1");
  var exp2 = new Expando("2");
  
  exp[o] = "foo";
  exp2[o] = "bar";
  
  Expect.equals("foo", exp[o]);
  Expect.equals("bar", exp2[o]);
}
