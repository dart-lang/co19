/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form e1.v = e2 proceeds as follows:
 * The expression e1 is evaluated to an object o1. Then, the expression e2 is
 * evaluated to an object o2. Then, the setter v is looked up in o1 with respect to
 * the current library, and its body is executed with its formal parameter bound
 * to o2 and this bound to o1.
 * If the setter lookup has failed, then a new instance im  of the predefined interface
 * InvocationMirror is created, such that :
 * im.isSetter evaluates to true.
 * im.memberName evaluates to ‘v’.
 * im.arguments.positionalArguments evaluates to [o2].
 * im.arguments.namedArguments evaluates to {}.
 * Then the method noSuchMethod() is looked up in o1 with argument im. The value of the assignment expression is
 * o2 irrespective of whether setter lookup has failed or succeeded.
 * @description Checks that method noSuchMethod is invoked with the specified argument
 * if v is an instance method.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */

class TestException {}

class C {
  noSuchMethod(InvocationMirror im) {
    Expect.isTrue(im.isSetter);
    Expect.equals('func', im.memberName);
    //Expect.listEquals([Closure], im.arguments.positionalArguments);  //Function.toString is not specified
    Expect.mapEquals({}, im.arguments.namedArguments);
    throw new TestException();
  }

  func() {}

  test() {
    try {
      func = () => 1;
      Expect.fail("Method noSuchMethod() was not properly executed!");
    } on TestException catch(e) {}
  }
}

main() {
  new C().test();
}
