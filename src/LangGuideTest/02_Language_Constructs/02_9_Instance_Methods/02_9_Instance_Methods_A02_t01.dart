/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All instance methods are virtual.
 * @description Checks trivial virtual call.
 * @author iefremov
 * @reviewer pagolubev
 */


class A {
  A() {}
  foo() { return 1; }
}

class B extends A {
  B() : super() {}
  int foo() { return 42; }
}


main() {
  A b = new B();
  Expect.isTrue(b.foo() == 42);
}
