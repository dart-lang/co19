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
 * @description Checks that result of the new expression is the result of the
 * final constructor in the chain of redirection.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

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

  var b = new B.name();
  Expect.equals(true, b.x);
  Expect.equals(false, b.y);
  Expect.equals(0, b.z);
}
