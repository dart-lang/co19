/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the getter lookup has failed, then a new instance im of the predefined
 * interface InvocationMirror is created by calling its factory constructor with arguments `get m`,
 * this, [] and fg. Then the method noSuchMethod() is looked
 * up in o and invoked with argument im, and the result of this invocation is the
 * result of evaluating i.
 * @description Checks that the result of invocation in case of failed getter lookup is the result
 * of invoking the appropriate noSuchMethod method.
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  noSuchMethod(String function_name, List args) {
    return "v";
  }
}

class B {
  noSuchMethod(String function_name, List args) {
    return true;
  }
}

class C {
  noSuchMethod(String function_name, List args) {
    return 1;
  }
}

class D {
  noSuchMethod(String function_name, List args) {
    return null;
  }
}

main()  {
  var classWithGetter = new A();
  Expect.equals("v", classWithGetter.v);

  classWithGetter = new B();
  Expect.equals(true, classWithGetter.v);

  classWithGetter = new C();
  Expect.equals(1, classWithGetter.v);

  classWithGetter = new D();
  Expect.equals(null, classWithGetter.v);
}
