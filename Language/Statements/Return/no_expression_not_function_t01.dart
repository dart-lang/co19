/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A return statement with no expression, return; is executed as
 * follows:
 * . . .
 * Otherwise the return statement is executed by executing the statement
 * return null; if it occurs inside a method, getter, setter or factory;
 * otherwise, the return statement necessarily occurs inside a generative
 * constructor, in which case it is executed by executing return this;
 *
 * @description Checks that a return statement of the form "return;" in a
 * method, getter, setter or factory is executed by executing the statement
 * "return null;".
 *
 * @static-warning
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

bar() {
  return;
}

abstract class I {
  factory I() { return; } //static warning: I may not be assigned to void
}

class Foo implements I {
  Foo() {}
  get foo { return; }
  method() { return; }

}

main() {
  var foo = new Foo();
  Expect.isNull(foo.foo);
  Expect.isNull(foo.method());
  Expect.isNull(new I());
}

