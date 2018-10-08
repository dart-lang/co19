/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A compound assignment of the form e1[e2] op=e3 is equivalent to
 * ((a, i) => a[i] = a[i] op e3)(e1, e2) where a and i are a variables that are
 * not used in e3.
 * @description Checks that a compound assignment expression of the form
 * e1[e2] &= e3 is equivalent to ((a, i) => a[i] = a[i] & e3)(e1, e2).
 * @author rodionov
 */
import '../../../../Utils/expect.dart';

class C {
  C(this.v) {
    getterInvocation = 0;
    setterInvocation = 0;
    getterSelectorArg = null;
    setterSelectorArg = null;
  }

  operator &(val) {
    C c = new C(v & val);
    return c;
  }

  operator [](idx) {
    ++getterInvocation;
    getterSelectorArg = idx;
    return v;
  }

  void operator []=(idx, val) {
    ++setterInvocation;
    setterSelectorArg = idx;
    v = val;
  }

  var v;
  int getterInvocation, setterInvocation;
  var getterSelectorArg, setterSelectorArg;
}

check(operand1, operand2, idx) {
  C c = new C(operand1);
  var expected = operand1 & operand2;
  var res = (c[idx] &= operand2);
  Expect.equals(1, c.getterInvocation);     //checks that fetching selector was invoked only one time
  Expect.equals(1, c.setterInvocation);     //checks that assignable selector was invoked only one time
  Expect.equals(idx, c.getterSelectorArg);
  Expect.equals(idx, c.setterSelectorArg);
  Expect.equals(expected, c.v);             //checks that result was assigned
}

main() {
  check(3, 3, "idx");
  check(10, 1, 0);
  check(5, 7, 0.1);
  check(-2, 1, false);
}
