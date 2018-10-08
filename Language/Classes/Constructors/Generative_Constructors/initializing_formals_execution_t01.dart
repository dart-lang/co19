/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Initializing formals are executed during the execution of
 * generative constructors detailed below. Executing an initializing formal
 * this.id causes the field id of the immediately surrounding class to be
 * assigned the value of the corresponding actual parameter, unless id is a
 * final variable that has already been initialized, in which case a runtime
 * error occurs.
 * @description Checks that fields corresponding to an initializing formal
 * are assigned correctly.
 * @author msyabro
 */
import "../../../../Utils/expect.dart";

class A {
  A(this.a, this.b);
  var a;
  var b;
}

class B {
  B([this.x =1 , this.y = 2]);
  var x;
  var y;
}

class C {
  C(this.c);
  var c = 1;
}

main() {
  var a = new A(0, 0);
  Expect.equals(0, a.a);
  Expect.equals(0, a.b);
  a = new A('', 'b');
  Expect.equals('', a.a);
  Expect.equals('b', a.b);
  a = new A(0.5, 123);
  Expect.equals(0.5, a.a);
  Expect.equals(123, a.b);

  var b = new B();
  Expect.equals(1, b.x);
  Expect.equals(2, b.y);
  b = new B(true, false);
  Expect.equals(true, b.x);
  Expect.equals(false, b.y);
  b = new B(10);
  Expect.equals(10, b.x);
  Expect.equals(2, b.y);

  var c = new C(2);
  Expect.equals(2, c.c);
  c = new C(null);
  Expect.equals(null, c.c);
}
