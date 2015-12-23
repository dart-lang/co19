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
 *  • Otherwise, if fid is a static method of the enclosing class C, i is
 *    equivalent to C.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k).
 * . . .
 * @description Checks that if fid is a static method of the enclosing class C,
 * i is equivalent to the static method invocation
 * C.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k).
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

class C {
  static m(p1, p2) {
    Expect.equals(1, p1);
    Expect.equals(1, p2);
    return 0;
  }

  test() {
    Expect.equals(0, m(1, 1));
    Expect.equals(C.m(1, 1), m(1, 1));
  }
}

main() {
  new C().test();
}
