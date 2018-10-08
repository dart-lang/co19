/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks that reference to a static setter is evaluated to the
 * getter invocation.
 * @author ngl@unipro.ru
 */
import '../../../Utils/expect.dart';

class C {
  void f() {
    Expect.equals(C.c, c);
    Expect.equals(C.s1, 2);
    Expect.equals(C.s1 = 4, 4);
    Expect.equals(C.s2 = 5, 5);
  }
  static var c = 1;
  static get s1 => ++c;
  static set s1(x) {c = x;}
  static set s2(x) {c = x;}
}


main() {
  C c = new C();
  c.f();
}
