/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Executing a return statement "return e;" first causes evaluation 
 * of the expression e, producing an object o. Next, control is transferred 
 * to the caller of the current function activation, and the object o is provided 
 * to the caller as the result of the function call.
 * @description Checks that the return statement returns the result of evaluating
 * the expression specified as its parameter and that it is possible that such evaluation
 * results in a runtime exception (in which case control is transferred to the appropriate
 * handler).
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
  //Expect.equals("foobar", foo("foo", "bar"));

  try {
    Expect.equals(100, bar(new A())); // can't be true, can it?
    Expect.fail("Exception expected when evaluating a return statement!");
  } on int catch(ok) {}
}
