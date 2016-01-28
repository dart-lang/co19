/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment a of the form v = e proceeds as
 * follows:
 * Let d be the innermost declaration whose name is v or v =, if it exists.
 * ...
 * Otherwise, if d is the declaration of a static variable, static getter or
 * static setter in class C, then the assignment is equivalent to the assignment
 * C.v = e.
 * @description Checks that an assignment of the form v = e, where v is a name
 * of a static variable in class C, is equivalent to the assignment C.v = e.
 * @author msyabro
 */
import '../../../Utils/expect.dart';

class C {
  static var v;
  test() {
    v = 1;
    Expect.equals(1, C.v);
    v = 2;
    Expect.equals(2, C.v);
    C.v = 1;
    Expect.equals(1, v);
    C.v = 1 + 2;
    Expect.equals(3, v);
  }
}

main() {
  C c = new C();
  c.test();
}
