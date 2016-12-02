/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(Object other)
 * Test whether another object is equal to this function.
 * System-created function objects are only equal to other functions.
 * Two function objects are known to represent the same function if
 *  - It is the same object. Static and top-level functions are compile time
 *  constants when used as values, so referring to the same function twice
 *  always give the same object,
 *  - or if they refer to the same member method extracted from the same object.
 *  Extracting a member method as a function value twice gives equal, but not
 *  necessarily identical, function values.
 *  Function expressions never give rise to equal function objects. Each time a
 *  function expression is evaluated, it creates a new closure value that is not
 *  known to be equal to other closures created by the same expression.
 *
 *  Classes implementing Function by having a call method should have their own
 *  operator== and hashCode depending on the object.
 * @description Checks that equality operator works as expected.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class C {
  m() {
  }
}

String foo(x1, y1, {x2 : "x2", y2}) {
  return "$x1$y1$x2$y2";
}

String bar(x1, y1, {x2 : "x2", y2}) {
  return "$x1$y1$x2$y2";
}

main() {
  Function f1 = foo;
  Function f2 = foo;
  Function b1 = bar;
  Function b2 = bar;

  Expect.isTrue(f1 == f2);
  Expect.isTrue(b1 == b2);
  Expect.isFalse(f1 == b1);

  Function m1 = new C().m;
  Function m2 = new C().m;
  Expect.isFalse(m1 == m2);
}
