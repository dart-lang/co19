/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion For each instance variable f of i, if the variable declaration
 * of f has an initializer, then f is bound to that value
 * (which is necessarily a compile-time constant). Otherwise f is bound to null.
 * Next, the argument list (a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is
 * evaluated. Then, q is executed with this bound to i,
 * the type parameters (if any) of C bound to the actual type arguments V1, ..., Vm and
 * the formal parameters of q bound to the corresponding actual arguments.
 * The result of the evaluation of e is i.
 * @description Checks that this.varName initializers are bound correctly when evaluating
 * the initializer list.
 * @author msyabro
 * @reviewer rodionov
 */

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

  o = new D.name();
  Expect.equals("x", o.x);
  Expect.equals("y", o.y);
  Expect.equals("z", o.z);
}
