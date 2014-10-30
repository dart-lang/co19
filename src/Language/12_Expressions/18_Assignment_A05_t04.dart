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
 * @description Checks that the value of an assignment expression is o2
 * even if setter lookup failed.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

var expected=const Symbol("nonExistingSetter=");

class C {
  noSuchMethod(Invocation im) {
    if(expected!=im.memberName) {
      Expect.fail("Incorrect method was searched: ${im.memberName}");
    }
  }
}

main() {
  C c = new C();  /// static type warning
  Expect.equals(1, c.nonExistingSetter = 1);
  Expect.equals(2, c.nonExistingSetter = 2);
  Expect.equals("12", c.nonExistingSetter = "1" "2");
  Expect.equals(true, c.nonExistingSetter = 1 < 2);
}
