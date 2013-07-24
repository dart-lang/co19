/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise, if m is the name of a getter member of o (declared implicitly
 * or explicitly) then o.m evaluates to the result of invoking the getter.
 * @description Checks that if m is the name of a getter, o.m evaluates to the result of
 * invoking the getter.
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

