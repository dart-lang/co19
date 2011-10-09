/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The unqualified identifier is resolved in the lexical scope and the assignment is evaluated as:
 * An instance-field assignment, this.identifier = rhs, if identifier resolved to an instance field or if identifier is unbound.
 * A static-field assignment, C.identifier = rhs, if identifier resolved to a static field or accessor declared in class C.
 * A variable or parameter assignment, identifier = rhs, if identifier resolved to a variable or parameter.
 * @description The identifier is resolved to an instance field.
 * @author msyabro
 * @reviewer pagolubev
 */

class A {
  var x;
  A() {}
  void func() {
    x = 1;
  }
}


void main() {
  A a = new A();
  a.func();
  Expect.isTrue(a.x == 1);
}
