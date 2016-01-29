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
 * @description Checks that iff one or both of operands is null, the result of
 * an equality expression is evaluated as identical(o1, o2) and the .== method
 * of whichever operand is not null never gets invoked.
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class C {
  bool operator ==(other) {
    throw "operator== invoked with $other argument!";
  }
}

void check(var o1, var o2) {
  Expect.equals(o1 == o2, identical(o1, o2));
}

main() {
  var foo=1;

  check(null, null);
  check(null, "null");
  check(null, new Object());
  check([1, 2, 3], null);
  check(null, const {'1': 1});
  check(1, null);
  check(false, null);
  check(new C(), null);
  check(null, new C());
  check(foo, null);
  check(null, foo);
}
