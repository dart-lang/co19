/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment a of the form v = e proceeds as
 * follows:
 * ...
 * Otherwise, the assignment is equivalent to the assignment this.v = e.
 * @description Checks that an assignment of the form v = e, where v is a name
 * for an instance variable declared in class C is equivalent to the assignment
 * this.v = e.
 * @author msyabro
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class C {
  var v;
  test() {
    v = 1;
    Expect.equals(1, this.v);
    v = 1 + 2;
    Expect.equals(3, this.v);
    this.v = 1;
    Expect.equals(1, v);
    this.v = 1 + 2;
    Expect.equals(3, this.v);
  }
}

main() {
  C c = new C();
  c.test();
}
