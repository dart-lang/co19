/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unqualified function invocation i has the form
 * id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k), where id is an identifier.
 * If there exists a lexically visible declaration named id, let fid be the
 * innermost such declaration. Then:
 * . . .
 *  • If fid is a local function, a library function, a library or static getter
 *    or a variable then i is interpreted as a function expression invocation.
 * . . .
 * @description Checks that if fid is a library variable, hence induced library
 * getter, then i is interpreted as a function expression invocation.
 * @author msyabro
 */
import '../../../../Utils/expect.dart';

var f = (p1) {
  Expect.equals(null, p1);
  return 100;
};

class A {
  test() {
    dynamic m = f;
    Expect.equals(100, m(null));

    m = 1;
    try {
      m(1, 2, 3);
      Expect.fail("NoSuchMethodError expected");
    } on NoSuchMethodError {}
  }
}

main() {
  new A().test();
}
