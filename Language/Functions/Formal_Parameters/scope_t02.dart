/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The formal parameter list of a function introduces a new scope
 * known as the function's formal parameter scope. The formal parameter scope
 * of a function f is enclosed in the scope where f is declared. Every formal
 * parameter introduces a local variable into the formal parameter scope.
 * The body of a function introduces a new scope known as the function's body
 * scope. The body scope of a function f is enclosed in the scope introduced by
 * the formal parameter scope of f.
 * @description Trivially checks that the function scopes are indeed nested
 * in the described order.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";


class C {
  static const foo = 1;

  void test() {
    f(var foo) {
      Expect.equals(2, foo);
    }
    f(foo + 1);

    g([var foo = foo + 10]) {
      Expect.equals(11, foo);
    }
    g();

    h({var foo: foo + 10}) {
      Expect.equals(11, foo);
    }
    h();
  }
}

void main() {
  new C().test();
}
