// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion Inside a catch clause, a caught exception can be re-thrown by issuing
 * a throw statement without any argument.
 * @description Checks that re-thrown exception will be captured.
 * @author pagolubev
 * @reviewer iefremov
 */

class A {
  A() : capture = false, rethrown = true {}

  baz() {
    throw "baz";
  }

  foo() {
    try {
      baz();
    } catch (Object exception) {
      rethrown = true;
      throw;
    }
  }

  bar() {
    try {
      foo();
    } catch (Object exception) {
      Expect.isTrue(rethrown == true);
      capture = true;
      Expect.isTrue(exception == "baz");
    }
  }

  bool capture;
  bool rethrown;
}


main() {
  A a = new A();
  a.bar();
  Expect.isTrue(a.capture);
}
