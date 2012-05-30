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
 * @description Checks that result of the new expression is the result of the final constructor
 * in the chain of redirection.
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  A() : this.redirected();
  A.redirected(): x = 1, y = 2, z = 3 {}
  
  var x;
  var y;
  var z;
}

class B {
  B() : x = 0, y = 0, z = 0 {}
  B.name(): this.redirected();
  B.redirected(): x = true, y = false, z = 0 {}
  
  var x;
  var y;
  var z;
}

main() {
  var o = new A();
  Expect.equals(1, o.x);
  Expect.equals(2, o.y);
  Expect.equals(3, o.z);

  o = new B.name();
  Expect.equals(true, o.x);
  Expect.equals(false, o.y);
  Expect.equals(0, o.z);
}
