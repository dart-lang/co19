/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If getter lookup has also failed, then a new instance im of the
 * predeﬁned class Invocation is created, such that:
 * • im.isMethod evaluates to true.
 * • im.memberName evaluates to ’m’.
 * • im.positionalArguments evaluates to an immutable list with the same values
 *   as [o1, ..., on].
 * • im.namedArguments evaluates to an immutable map with the same keys and
 *   values as {xn+1:on+1, ..., xn+k:on+k}.
 * Then the method noSuchMethod() is looked up in Sdynamic and invoked on this
 * with argument im, and the result of this invocation is the result of
 * evaluating i.
 * @description Checks that it is a compile error if there're no members,
 * instance or static, with the required name in the invoking class's
 * superclass.
 * @compile-error
 * @author msyabro
 */
import '../../../../Utils/expect.dart';

class TestException {}

class S {
  noSuchMethod(Invocation im) {
    throw new TestException();
  }
}

class A extends S {
  test() {
    try {
      super.nonExistingMethod();
      Expect.fail("Exception is expected");
    } on TestException catch (e) {}
  }
}

main()  {
  new A().test();
}
