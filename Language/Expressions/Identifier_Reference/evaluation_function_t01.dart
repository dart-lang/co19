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
 * • If d is a static method, top-level function or local function then e
 *   evaluates to the function defined by d.
 * @description Checks that reference to a static method is evaluated correctly.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

class A {
  static staticFunc() {
    return i*6;
  }
  static var i;
  void f() {
    var x = staticFunc; //expression must evaluate to the method [staticFunc]
    i = 3;
    Expect.equals(18, x());
  }
}

main() {
  A a = new A();
  a.f();
}
