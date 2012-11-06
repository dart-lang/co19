/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unqualified function invocation i has the form id(a1, ... , an, xn+1 : an+1, ... , xn+k :
 * an+k), where id is an identifier.
 * If there exists a lexically visible declaration named id, let fid be the inner-
 * most such declaration. Then:
 *  - If fid is a local function, a library function, a library or static getter or a
 * variable then i is interpreted as a function expression invocation.
 *  - Otherwise, if fid is a static method of the enclosing class C, i is equivalent
 * the static method invocation C.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k).
 * Otherwise, i is equivalent to the ordinary method invocation this.id(a1, ... , an, xn+1 :
 * an+1, ... , xn+k : an+k).
 * @description Checks that if fid is a library function,
 * then i is interpreted as a function expression invocation.
 * @author msyabro
 * @reviewer rodionov
 */

import "3_Unqualified_Invocation_lib.dart";

m2(p1) {
  Expect.equals("ab", p1);
  return 2;
}

class A {
  test() {
    Expect.equals(0, m("a" "b"));
    Expect.equals(2, m2("a" "b"));
  }
}

main() {
  new A().test();
}
