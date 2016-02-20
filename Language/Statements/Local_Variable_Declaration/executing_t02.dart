/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Executing a variable declaration statement of one of the forms
 * var v = e;, T v = e;, const v = e;, const T v = e;, final v = e; or
 * final T v = e; proceeds as follows:
 * The expression e is evaluated to an object o. Then, the variable v is set
 * to o.
 * @description Checks that an expression e is evaluated correctly in a multiple
 * variable declaration statement.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

foo(p1) {
  return p1 + 1;
}

bar(p1, p2) {
  return p1 - p2;
}

check(p1) {
  var x, y = foo(p1 + 2);
  var a = foo(2), b;
  var c = bar(p1, p1), d = bar(p1, p1 - 1);

  Expect.equals(null, x);
  Expect.equals(p1 + 3, y);
  Expect.equals(3, a);
  Expect.equals(null, b);
  Expect.equals(0, c);
  Expect.equals(1, d);
}

main() {
  check(1);
}
