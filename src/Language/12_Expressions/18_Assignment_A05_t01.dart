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
 * InvocationMirror is created, such that :
 * - im.isSetter evaluates to true.
 * - im.memberName evaluates to ’v=’.
 * - im.positionalArguments evaluates to [o2 ].
 * - im.namedArguments evaluates to the value of {}.
 * Then the method noSuchMethod() is looked up in o1 with argument im. The value of the assignment expression is
 * o2 irrespective of whether setter lookup has failed or succeeded.
 * @description Checks that an assignment of the form e1.v = e2 is evaluated correctly.
 * @author msyabro
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

class C {
  var _v;
  var t;

  set v(val) {
    _v = val;
    t = val + 1;
  }
  get v {
    return _v;
  }
}

main() {
  C c = new C();
  c.v = 1;
  Expect.equals(1, c.v);
  Expect.equals(2, c.t);
  c.v = 2;
  Expect.equals(2, c.v);
  Expect.equals(3, c.t);
  c.v = 1;
  Expect.equals(1, c.v);
  Expect.equals(2, c.t);
  c.v = 2 * 6;
  Expect.equals(12, c.v);
  Expect.equals(13, c.t);
}
