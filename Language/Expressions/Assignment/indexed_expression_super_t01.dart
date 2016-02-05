/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An assignment of the form super[e1] = e2 is equivalent to the
 * expression super.[e1] = e2
 * @description Checks that an assignment of the form super[e1] = e2 is
 * equivalent to super.[e1] = e2
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class A {
  var v, i;

  operator [](idx) {
    return v;
  }

  operator []=(idx, val) {
    i = idx;
    v = val;
  }
}

class C extends A {
  test() {
    var res = (super[-10] = 1);
    Expect.equals(1, res);
    Expect.equals(1, super.v);
    Expect.equals(-10, super.i);

    Expect.equals(2, super[true] = 2);
    Expect.equals(2, super.v);
    Expect.equals(true, super.i);

    super["foo"] = 1;
    Expect.equals(1, super.v);
    Expect.equals("foo", super.i);

    super[-1.1] = 2 * 6;
    Expect.equals(12, super.v);
  }
}

main() {
  C c = new C();
  c.test();
}
