/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form e1.v = e2 proceeds as
 * follows:
 * ...
 * If the setter lookup has failed, then a new instance im of the predefined
 * class Invocation is created, such that :
 *  • im.isSetter evaluates to true.
 *  • im.memberName evaluates to the symbol v=.
 *  • im.positionalArguments evaluates to an immutable list with the same values
 *    as [o2].
 *  • im.namedArguments evaluates to the value of const {}.
 *  Then the method noSuchMethod() is looked up in o1 and invoked with
 *  argument im. However, if the implementation found cannot be invoked with
 *  a single positional argument, the implementation of noSuchMethod() in class
 *  Object is invoked on o1
 * @description Checks that method noSuchMethod is invoked with the right
 * argument if there is no setter for v in o1.
 * @author msyabro
 */
import '../../../Utils/expect.dart';

class TestException {}

class C {
  noSuchMethod(Invocation im) {
    Expect.isTrue(im.isSetter);
    Expect.equals(const Symbol("setter="), im.memberName);
    Expect.listEquals([1], im.positionalArguments);
    Expect.mapEquals({}, im.namedArguments);
    throw new TestException();
  }
}

main() {
  dynamic c = new C();
  try {
    c.setter = 1;
    Expect.fail("TestException is expected");
  } on TestException catch (e) {}
}
