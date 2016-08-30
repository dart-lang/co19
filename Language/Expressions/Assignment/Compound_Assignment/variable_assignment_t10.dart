/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion For any other valid operator op, a compound assignment of the
 * form v op =e is equivalent to v=v op e
 * @description Checks that an expression of the form v &= e is equivalent
 * to v = v & e.
 * @author msyabro
 */
import '../../../../Utils/expect.dart';

class C {
  C(this.v);

  operator &(val) {
    C c = new C(v & val);
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

  test(val, expected) {
    var res = (c &= val);
    Expect.equals(1, getterInvocation);     //checks that getter was invoked only one time
    Expect.equals(1, setterInvocation);     //checks that setter was invoked only one time
    Expect.equals(expected, c.v);           //checks that result was assigned
    Expect.equals(expected, res.v);         //checks result
  }

  C _c;

  int getterInvocation;
  int setterInvocation;
}

main() {
  new A(3).test(3, 3 & 3);
  new A(10).test(1, 10 & 1);
  new A(5).test(7, 5 & 7);
  new A(-2).test(1, -2 & 1);
}
