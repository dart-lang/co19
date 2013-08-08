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
 *   If the setter lookup has failed, then a new instance im of the predefined class
 * Invocation is created, such that :
 * - im.isSetter evaluates to true.
 * - im.memberName evaluates to ’v=’.
 * - im.positionalArguments evaluates to an immutable list with the same values as [o2].
 * -im.namedArguments evaluates to the value of const {}.
 * Then the method noSuchMethod() is looked up in o1 with argument im. The value of the assignment expression is
 * o2 irrespective of whether setter lookup has failed or succeeded.
 * @description Checks that method noSuchMethod is invoked with the specified argument
 * if there is no setter for v in o1.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 * @issue 3326
 */
import "../../Utils/expect.dart";

class TestException {}

class C {
  noSuchMethod(Invocation im) {
    Expect.isTrue(im.isSetter);
    Expect.equals('setter=', im.memberName);
    Expect.listEquals([1], im.positionalArguments);
    Expect.mapEquals({}, im.namedArguments);
    throw new TestException();
  }
}

main() {
  C c = new C();
  try {
    c.setter = 1; /// static type warning
    Expect.fail("TestException is expected");
  } on TestException catch(e) {}
}
