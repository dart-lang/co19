/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form e1[e2] = e3 is equivalent
 * to the evaluation of the expression
 * (a, i, e){a.[]=(i, e); return e;} (e1, e2, e3).
 * @description Checks that an assignment of the form e1[e2] = e3  is equivalent
 * to (a, i, e){a.[]=(i, e); return e;} (e1, e2, e3).
 * @author rodionov
 */
import '../../../Utils/expect.dart';

class C {
  var v, i;

  operator [](idx) {
    return v;
  }

  operator []=(idx, val) {
    i = idx;
    v = val;
  }
}

main() {
  C c = new C();
  var res = (c[-10] = 1);
  Expect.equals(1, res);
  Expect.equals(1, c.v);
  Expect.equals(-10, c.i);

  Expect.equals(2, c[true] = 2);
  Expect.equals(2, c.v);
  Expect.equals(true, c.i);

  c["foo"] = 1;
  Expect.equals(1, c.v);
  Expect.equals("foo", c.i);

  c[-1.1] = 2 * 6;
  Expect.equals(12, c.v);
}
