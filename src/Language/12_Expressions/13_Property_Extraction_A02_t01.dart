/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise e.m is treated as a getter invocation.
 * @description Checks that if type of e has a getter named m, e.m evaluates
 * to the result of invoking the getter.
 * @author msyabro
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

class C {
  C(): this.v2 = 0;
  get v1 {return "v1";}
  var v2;
}

main() {
  var o = new C();
  Expect.equals("v1", o.v1);
  Expect.equals(0, o.v2);
}

