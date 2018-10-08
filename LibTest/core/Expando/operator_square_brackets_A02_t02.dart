/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Expando toString method override.
 * @description Checks that the value returned by this method is indeed a String.
 * @author rodionov
 */
import "../../../Utils/expect.dart";


main() {
  var exp = new Expando();
  var exp2 = new Expando("2");
  Expect.isTrue(exp.toString() is String);
  Expect.isTrue(exp2.toString() is String);
  
  var o1 = new Object();
  exp[o1] = "1";
  exp2[o1] = "2";
  Expect.isTrue(exp.toString() is String);
  Expect.isTrue(exp2.toString() is String);
}
