/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An unconditional ordinary method invocation i has the form
 * o.m(a1, ..., an, xn+1 : an+1, ..., xn+k : an+k).
 * @description Checks static invocations, when o denotes a class in the
 * current scope. Arguments must be separated with a comma.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

class C {
  static f(p1, p2) {}
}

main() {
  try {
    C.f(1 2);
  } catch (e) {}
}
