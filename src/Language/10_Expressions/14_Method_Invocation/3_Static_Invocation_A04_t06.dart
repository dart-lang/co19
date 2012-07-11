/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of i proceeds as follows:
 * If C does not denote a class in the current scope, or if C does not declare 
 * a static method or getter m then a NoSuchMethodError is thrown.
 * Otherwise, evaluation proceeds as follows:
 *   - If the member m declared by C is a getter, then i is equivalent
 *     to the expression C.m.call(a1, …, an, xn+1: an+1, …, xn+k: an+k).
 *   - Otherwise, let f be the the method m declared in class C. Next, 
 *     the argument list(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is evaluated.
 * The body of f is then executed with respect to the bindings that resulted
 * from the evaluation of the argument list. The value of i is the value returned
 * after the body of f is executed.
 * @description Checks that the function returned by a getter m is invoked.
 * @author kaigorodov
 * @reviewer rodionov
 */

class C {
  static get func() {return (a)=>a;}
}

main()  {
  Expect.equals(null, C.func(null));
  Expect.equals(123, C.func(123));
  Expect.equals("v", C.func("v"));
}
