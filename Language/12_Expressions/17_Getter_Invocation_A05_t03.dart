/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a getter invocation i of the form C.m proceeds as follows:
 * If there is no class C in the enclosing lexical scope of i, or if C does not
 * declare, implicitly or explicitly, a getter named m, then a NoSuchMethodError
 * is thrown.
 * Otherwise, the getter function C.m is invoked. The value of i is the result returned by
 * the call to the getter function.
 * It is a static warning if there is no class C in the enclosing lexical scope
 * of i, or if C does not declare, implicitly or explicitly, a getter named m. The
 * static type of i is the declared return type of C.m if it exists or dynamic otherwise.
 * @description Checks that the value of a getter invocation of the form C.m is the value
 * returned by the appropriate getter function in C.
 * @author msyabro
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";

class A {
  static get v {
    return "v";
  }
}

class B {
  static get v {
    return false;
  }
}

class C {
  static get v {
    return 1;
  }
}

class D {
  static get v {
    return null;
  }
}

main()  {
  Expect.equals("v", A.v);
  Expect.equals(false, B.v);
  Expect.equals(1, C.v);
  Expect.equals(null, D.v);
}
