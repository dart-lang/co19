/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form e1.v = e2 proceeds as
 * follows:
 * The expression e1 is evaluated to an object o1. Then, the expression e2 is
 * evaluated to an object o2.
 * ...
 * The value of the assignment expression is o2 irrespective of whether setter
 * lookup has failed or succeeded.
 * @description Checks that the value of an assignment expression is o2
 * even if setter lookup failed.
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

var expected = const Symbol("v=");

class A {
  noSuchMethod(Invocation im) {
    if(expected != im.memberName) {
      Expect.fail("Incorrect method was searched: ${im.memberName}");
    }
  }
}

class C extends A {
  test() {
    Expect.equals(1, super.v = 1);  /// static type warning
    Expect.equals(2, super.v = 2);  /// static type warning
    Expect.equals("12", super.v = "1" "2"); /// static type warning
    Expect.equals(true, super.v = 1 < 2);   /// static type warning
  }
}

main() {
  C c = new C();
  c.test();
}
