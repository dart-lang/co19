/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Executing a return statement return e; proceeds as follows:
 * First the expression e is evaluated, producing an object o. Next:
 * • The current return value is set to o and the current exception and active
 *   stack trace become undefined.
 * • Let c be the finally clause of the innermost enclosing try-finally
 *   statement, if any. If c is defined, let h be the handler induced by c. If
 *   h is defined, control is transferred to h.
 * • Otherwise execution of the current method terminates.
 *
 * @description Checks that the return statement returns a value received after
 * evaluating the return expression and if this evaluation results in a runtime
 * exception the control is transferred to the appropriate handler.
 *
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

foo(x, y) {
  return (x + y);
}

bar(var x) {
  return x.run();
}

class A {
  run() {
    throw 1;
  }
}

main() {
  Expect.equals(3, foo(1, 2));
  Expect.equals("foobar", foo("foo", "bar"));

  try {
    Expect.equals(100, bar(new A())); // can't be true, can it?
    Expect.fail("Exception expected when evaluating a return statement!");
  } on int catch (ok) {}
}
