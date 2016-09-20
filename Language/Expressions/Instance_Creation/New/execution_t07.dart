/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Next, q is executed with this bound to i, the type parameters
 * (if any) of R bound to the actual type arguments V1, ..., Vm and the formal
 * parameter bindings that resulted from the evaluation of the argument list.
 * The result of the evaluation of e is i.
 * @description Checks that this.varName initializers are bound correctly when
 * evaluating the initializer list.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

class C {
  C(): this.x = 1, this.y = 2, this.z = 3 {}
  var x;
  var y;
  var z;
}

class D {
  D.name(): this.x = "x", this.y = "y", this.z = "z" {}
  var x;
  var y;
  var z;
}

main() {
  var o = new C();
  Expect.equals(1, o.x);
  Expect.equals(2, o.y);
  Expect.equals(3, o.z);

  var d = new D.name();
  Expect.equals("x", d.x);
  Expect.equals("y", d.y);
  Expect.equals("z", d.z);
}
