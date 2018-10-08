/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
 * @author msyabro
 */
import '../../../Utils/expect.dart';

var expected = const Symbol("nonExistingSetter=");

class C {
  noSuchMethod(Invocation im) {
    if (expected != im.memberName) {
      Expect.fail("Incorrect method was searched: ${im.memberName}");
    }
  }
}

main() {
  dynamic c = new C();
  Expect.equals(1, c.nonExistingSetter = 1);
  Expect.equals(2, c.nonExistingSetter = 2);
  Expect.equals("12", c.nonExistingSetter = "1" "2");
  Expect.equals(true, c.nonExistingSetter = 1 < 2);
}
