/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an equality expression ee of the form e1 == e2
 * proceeds as follows:
 * •  The expression e1 is evaluated to an object o1.
 * •  The expression e2 is evaluated to an object o2.
 * •  If either o1 or o2 is null, then ee evaluates to true if both o1 and o2
 *    are null and to false otherwise. Otherwise,
 * •  ee is equivalent to the method invocation o1.==(o2).
 * @description Checks that if operands are not null ee is equivalent to the
 * method invocation o1.==(o2).
 * @author msyabro
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

class TestException {}

class A {
  operator ==(other) {
    throw new TestException();
  }
}

main() {
  A a = new A();
  try {
    a == 1;
    Expect.fail("operator== was not called");
  } on TestException catch (e) {}
}
