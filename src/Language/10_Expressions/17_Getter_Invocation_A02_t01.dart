/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the getter lookup has failed, then a new instance im of the predefined
 * class InvocationMirror is created, such that :
 * - im.isGetter evaluates to true.
 * - im.memberName evaluates to ’m’.
 * - im.arguments.positionalArguments evaluates to the value of [].
 * - im.arguments.namedArguments evaluates to the value of {}.
 * Then the method noSuchMethod() is looked up in o and invoked with argument im,
 * and the result of this invocation is the result of evaluating i.
 * @description Checks that the method noSuchMethod is invoked with the specified arguments
 * if getter lookup has failed.
 * @author msyabro
 * @reviewer rodionov
 * @needsreview issue 3223, 3326
 */

class TestException {}

class C {
  noSuchMethod(InvocationMirror im) {
    Expect.equals('g3tt3r', im.memberName);
    Expect.isTrue(im.isGetter);
    Expect.listEquals([], im.arguments.positionalArguments);
    Expect.mapEquals({}, im.arguments.namedArguments);
    throw new TestException();
  }
}

main()  {
  var o = new C();
  try {
    o.g3tt3r;
    Expect.fail("TestException is expected");
  } on TestException catch(e) {}
}
