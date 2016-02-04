/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form e1[e2] = e3 is equivalent
 * to the evaluation of the expression
 * (a, i, e){a.[]=(i, e); return e;} (e1, e2, e3).
 * @description Checks that the value of an assignment of the form e1[e2] = e3
 * is the result of evaluating e3.
 * @author rodionov
 */
import '../../../Utils/expect.dart';

class C {
  var v;

  operator [](idx) {
    return v;
  }

  operator []=(idx, val) {
    v = val;
    return null;
  }
}

main() {
  C c = new C();
  Expect.equals(1, c[0] = 1);
  Expect.equals(2, c[true] = 2);
  Expect.equals(1, c["foo"] = 1);
  Expect.equals(12, c[-1.0] = 2 * 6);
}
