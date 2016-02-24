/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a compile-time error to reference a local function
 * before its declaration.
 * @description Checks that it is no a compile-error if at first define a pair
 * of variables and then assigning them appropriate closures.
 * @author ngl@unipro.ru
 */
import '../../../Utils/expect.dart';

f() {
  var p, q;
  p = (x) => q(x, x);
  q = (a, b) => a > 0 ? p(a - 1) : b;
  Expect.isTrue(p(2) == 0);
  Expect.isTrue(q(0, 4) == 4);
}

main() {
  f();
}
