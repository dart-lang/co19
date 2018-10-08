/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
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
 * of a static getter in class C, is equivalent to the assignment C.v = e.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class C {

  static int get v => 0;
  
  test() {
    v = 1;
  }
}

main() {
  C c = new C();
  c.test();
}
