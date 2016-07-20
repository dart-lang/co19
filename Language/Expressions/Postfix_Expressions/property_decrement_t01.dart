/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A postfix expression of the form C.v-- is equivalent to
 * (){var r = C.v; C.v = r - 1; return r}().
 * @description Checks that evaluation of an expression of the form C.v--
 * is equivalent to (){var r = C.v; C.v = r - 1; return r;}().
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class C {
  static var v;
}

void test(var n) {
  C.v = n;
  var r = C.v--;
  Expect.equals(r, n);
  Expect.equals(C.v, (n - 1));
}

main() {
  test(0);
  test(-1);
  test(1);
  test(1000000);
  test(-1000000);
}
