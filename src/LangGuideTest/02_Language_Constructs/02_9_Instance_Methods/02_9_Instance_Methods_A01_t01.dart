/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Instance methods may only be called on instances.
 * @description Checks instance method calls.
 * @author pagolubev
 * @reviewer iefremov
 */


class A {
  A() {}
  int foo() { return 1; }
  int bar() { return 2; }
}



main() {
  A a = new A();
  Expect.isTrue(a.foo() == 1);
  Expect.isTrue(a.bar() == 2);
}
