/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of i proceeds as follows:
 * If C does not declare
 * a static method or getter m then the argument list (a1, ..., an, xn+1:an+1,
 * ..., xn+k:an+k) is evaluated, after which a NoSuchMethodError is thrown.
 * Otherwise, evaluation proceeds as follows:
 *   - If the member m declared by C is a getter, then i is equivalent
 *     to the expression (C.m)(a1, …, an, xn+1: an+1, …, xn+k: an+k).
 *   - Otherwise, let f be the the method m declared in class C. Next, 
 *     the argument list(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is evaluated.
 * The body of f is then executed with respect to the bindings that resulted
 * from the evaluation of the argument list. The value of i is the value returned
 * after the body of f is executed.
 * @description Checks that the value of a static method invocation is the value returned by method m.
 * @author msyabro
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

class A {
  static m() {
    return "v";
  }
}

class B {
  static m() {
    return false;
  }
}

class C {
  static m() {
    return 1;
  }
}

class D {
  static m() {
    return null;
  }
}

main()  {
  Expect.equals("v", A.m());
  Expect.equals(false, B.m());
  Expect.equals(1, C.m());
  Expect.equals(null, D.m());
}
