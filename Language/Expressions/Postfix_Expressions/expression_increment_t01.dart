/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A postfix expression of the form e1.v++ is equivalent to
 * (x){var r = x.v; x.v = r + 1; return r}(e1 ).
 * @description Checks that evaluation of an expression of the form e1.v++
 * is equivalent to (x){var r = x.v; x.v = r + 1; return r;}(e1) in effect.
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class C {
  var v;
  C(this.v);
}

void test(var n) {
  var e1 = new C(n);
  var r = e1.v++;
  Expect.equals(r, n);
  Expect.equals(e1.v, (n + 1));
}

main() {
  test(0);
  test(-1);
  test(1);
  test(1000000);
  test(-1000000);
}
