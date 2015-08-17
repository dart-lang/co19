/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a getter invocation i of the form e.m proceeds as follows:
 * First, the expression e is evaluated to an object o. Then, the getter function
 * m is looked up in o with respect to the current library, and its body is
 * executed with this bound to o. The value of the getter invocation expression is
 * the result returned by the call to the getter function.
 * @description Checks that the value of a getter invocation is the same as
 * the one returned by the corresponding getter function.
 * @author msyabro
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";

class A {
  get v {
    return "v";
  }
}

class B {
  get v {
    return false;
  }
}

class C {
  get v {
    return 1;
  }
}

class D {
  get v {
    return null;
  }
}

main()  {
  var classWithGetter = new A();
  Expect.equals("v", classWithGetter.v);
  
  classWithGetter = new B();
  Expect.equals(false, classWithGetter.v);
  
  classWithGetter = new C();
  Expect.equals(1, classWithGetter.v);
  
  classWithGetter = new D();
  Expect.equals(null, classWithGetter.v);
}
