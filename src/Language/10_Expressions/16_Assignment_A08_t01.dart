/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form e1[e2] = e3 is equivalent to the
 * evaluation of the expression (a, i, e){a.[]=(i, e); return e;} (e1, e2, e3).
 * @description Checks that an assignment of the form e1[e2] = e3 is evaluated correctly.
 * @author rodionov
 */

class C {
  var v;

  operator[](idx) {
    return v;
  }

  operator[]=(idx, val) {
    v = val;
  }
}

main() {
  C c = new C();
  c[0] = 1;
  Expect.equals(1, c.v);
  c[true] = 2;
  Expect.equals(2, c.v);
  c["foo"] = 1;
  Expect.equals(1, c.v);
  c[-1.1] = 2 * 6;
  Expect.equals(12, c.v);
}
