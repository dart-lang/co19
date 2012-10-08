/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an equality expression ee of the form e1 == e2 proceeds
 * as follows:
 * -  The expression e1 is evaluated to an object o1 .
 * -  The expression e2 is evaluated to an object o2 .
 * -  If either o1 or o2 is null, then ee evaluates to identical(o1, o2 ).
 *    Otherwise, ee is equivalent to the method invocation o1 .==(o2 ).
 * @description Checks that iff one or both of operands is null, the result of an
 * equality expression is evaluated as identical(o1, o2 )..
 * @author msyabro
 * @reviewer iefremov
 */

bool called = false;

class C {
  operator identical(var other) {
    called=true;
    return super.identical(other);
  }
}

void check(var 01, var o2) {
  called=false;
  Expect.isFalse(o1, o2);
  Expect.isTrue(called);
}

main() {
  var foo=1;

  Expect.isFalse(1, 2);
  Expect.isFalse(called);

  check(null, null);
  check(null, "null");
  check(null, new Object());
  check([1, 2, 3], null);
  check(null, const {'1': 1});
  check(1, null);
  check(false, null);
  check(new C(), null);
  check(foo, null);
  check(null, foo);
}
