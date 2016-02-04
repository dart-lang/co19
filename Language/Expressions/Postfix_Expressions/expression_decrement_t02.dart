/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A postfix expression of the form e1.v-- is equivalent to
 * (x){var r = x.v; x.v = r - 1; return r}(e1 ).
 * @description Checks that evaluation of an expression of the form e1.v-- is
 * equivalent to (x){var r = x.v; x.v = r - 1; return r;}(e1) in implementation
 * (basically, that postfix -- works via operator- in the described manner).
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

bool opInvoked = false;

class A {
  final String value;

  A(this.value);

  operator -(var other) {
    opInvoked = true;
    return new A("${value}-${other}");
  }
}

class C {
  A v;
  C(arg) {
    v = new A(arg);
  }
}

main() {
  var e1 = new C("foo");
  Expect.isFalse(opInvoked);

  Expect.equals("foo", (e1.v--).value);
  Expect.isTrue(opInvoked);
  Expect.equals("foo-1", e1.v.value);
}
