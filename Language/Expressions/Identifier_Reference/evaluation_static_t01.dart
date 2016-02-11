/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an identifier expression e of the form id proceeds
 * as follows:
 * Let d be the innermost declaration in the enclosing lexical scope whose name
 * is id or id=. If no such declaration exists in the lexical scope, let d be
 * the declaration of the inherited member named id if it exists.
 * ...
 * • If d is the declaration of a static variable, static getter or static
 *   setter declared in class C, then e is equivalent to the getter invocation
 *   C.id.
 * @description Checks that reference to a static variable/getter is evaluated
 * correctly.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

class C {
  void f() {
    Expect.equals(C.c, c);
    Expect.equals(C.d, d);
  }
  static var c = 1;
  static get d => 2;
}

main() {
  C c = new C();
  c.f();
}
