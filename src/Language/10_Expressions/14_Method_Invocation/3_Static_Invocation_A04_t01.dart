/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of i proceeds as follows:
 * First, if the member m declared by C is a getter, then let f be the result of
 * evaluating the getter invocation C.m. If f is not a function then an ObjectNotAClosure is thrown.
 * Otherwise, let f be the the method m declared in class C.
 * Next, the argument list(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is evaluated.
 * The body of f is then executed with respect to the bindings that resulted
 * from the evaluation of the argument list. The value of i is the value returned
 * after the body of f is executed.
 * @description Checks that if m is a function,
 * it is executed with respect to the bindings of the evaluated argument list.
 * @author msyabro
 * @reviewer kaigorodov
 */

class TestException {}

class C {
  static func(exception) {throw exception;}
}

main()  {
  try {
    C.func(new TestException());
    Expect.fail("Exception is expected");
  } catch(TestException e) {}
}