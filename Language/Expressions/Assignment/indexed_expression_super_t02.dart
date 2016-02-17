/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An assignment of the form super[e1] = e2 is equivalent to the
 * expression super.[e1] = e2
 * @description Checks that the value of an assignment of the form super[e1]=e2
 * is the result of evaluating e2.
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class A {
  var v;

  operator [](idx) {
    return v;
  }

  operator []=(idx, val) {
    v = val;
    return null;
  }
}

class C extends A {
  test() {
    Expect.equals(1, super[0] = 1);
    Expect.equals(2, super[true] = 2);
    Expect.equals(1, super["foo"] = 1);
    Expect.equals(12, super[-1.0] = 2 * 6);
  }
}

main() {
  C c = new C();
  c.test();
}
