/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error to declare an optional named parameter in an operator,
 * with the exception of the operator call.
 * @description Checks that operator call can contain optional named parameters.
 * @author msyabro
 * @needsreview Issue 1604
 */

class C {
  operator call(p1, p2, [p3 = 1, p4 = 2]) {}
}

main() {
  new C()(1, 2, p4: 10);
}
