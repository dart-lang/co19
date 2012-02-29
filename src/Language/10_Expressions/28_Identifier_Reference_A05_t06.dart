/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an identifier expression e of the form id proceeds as follows:
 * Let d be the innermost declaration in the enclosing lexical scope whose name
 * is id.
 *  - If d is a library variable, local variable, or formal parameter, then e evaluates
 * to the current binding of id. This case also applies if d is a library or
 * local function declaration, as these are equivalent to function-valued variable
 * declarations.
 *  - If d is a static method, then e evaluates to the function defined by d.
 *  - If d is the declaration of a static variable or static getter declared in class
 * C, then e is equivalent to the getter invocation C.id.
 *  - If d is the declaration of a top level getter, then e is equivalent to the
 * getter invocation id.
 *  - Otherwise, e is equivalent to the property extraction this.id.
 * @description Checks that latter case is evaluated correctly.
 * @author msyabro
 * @reviewer kaigorodov
 */

class A {
  A() : y = 10;
  func() {
    try {
      x;
      Expect.fail("NoSuchMethodException expected");
    } catch(NoSuchMethodException e) {}

    Expect.equals(10, y);
  }
  var y;
}

main() {
  A a = new A();
  a.func();
}