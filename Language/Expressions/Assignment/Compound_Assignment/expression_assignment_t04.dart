/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A compound assignment of the form e1.v op = e2 is equivalent
 * to ((x) => x.v = x.v op e2)(e1) where x is a variable that is not used in e2.
 * @description Checks that an expression of the form e1.v %= e2 is equivalent
 * to ((x) => x.v = x.v % e2)(e1) where x is a variable that is not used in e2.
 * @author msyabro
 */
import '../../../../Utils/expect.dart';

class C {
  C(this.v);

  operator %(val) {
    C c = new C(v % val);
    return c;
  }

  var v;
}

class A {
  A(val) {
    _c = new C(val);
    getterInvocation = 0;
    setterInvocation = 0;
  }

  get c {
    ++getterInvocation;
    return _c;
  }

  set c(val) {
    ++setterInvocation;
    _c = val;
  }

  C _c;

  int getterInvocation;
  int setterInvocation;
}

check(operand1, operand2) {
  A a = new A(operand1);
  var expected = operand1 % operand2;
  var res = (a.c %= operand2);
  Expect.equals(1, a.getterInvocation);     //checks that getter was invoked only one time
  Expect.equals(1, a.setterInvocation);     //checks that setter was invoked only one time
  Expect.equals(expected, a.c.v);           //checks that result was assigned
  Expect.equals(expected, res.v);           //checks value
}

main() {
  check(3, 3);
  check(10, 1);
  check(5, 7);
  check(-2, 1);
}
