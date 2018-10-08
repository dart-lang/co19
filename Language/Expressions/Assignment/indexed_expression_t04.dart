/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form e1[e2] = e3 is equivalent
 * to the evaluation of the expression
 * (a, i, e){a.[]=(i, e); return e;} (e1, e2, e3).
 * @description Checks that the correct value of an assignment expression of
 * the form e1[e2] = e3 is still returned even if no []= operator was found in
 * the type of e1, as long as noSuchMethod() is overridden and no exception
 * is thrown.
 * @author rodionov
 */
import '../../../Utils/expect.dart';

class C {
  operator [](idx) {}

  noSuchMethod(Invocation im) {
    Expect.equals(const Symbol("[]="), im.memberName,
        "Incorrect method was searched: ${im.memberName}");
  }
}

main() {
  dynamic c = new C();
  Expect.equals(1, c[1] = 1);
  Expect.equals(2, c[false] = 2);
  Expect.equals("12", c["foo"] = "1" "2");
  Expect.equals(true, c[-1.11] = 1 < 2);
}
