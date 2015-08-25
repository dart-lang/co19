/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the getter lookup has failed, then a new instance im of the predeﬁned
 * class Invocation is created, such that :
 * - im.isGetter evaluates to true.
 * - im.memberName evaluates to ’m’.
 * - im.positionalArguments evaluates to the value of const [].
 * - im.namedArguments evaluates to the value of const {}.
 * Then the method noSuchMethod() is looked up in o and invoked with argument im,
 * and the result of this invocation is the result of evaluating i.
 * @description Checks that the method noSuchMethod is invoked with the specified arguments
 * if getter lookup has failed.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class TestException {}

class C {
  noSuchMethod(Invocation im) {
    Expect.equals(#g3tt3r, im.memberName);
    Expect.isTrue(im.isGetter);
    Expect.isNotNull(im.positionalArguments);
    Expect.isNotNull(im.namedArguments);
    Expect.listEquals([], im.positionalArguments);
    Expect.mapEquals({}, im.namedArguments);
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
