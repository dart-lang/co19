/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static-field compound assignment C.identifier OP= rhs is evaluated in a fashion that is equivalent to:
 * C.identifier = C.identifier OP rhs
 * @description Check that operator >>>= works correctly
 * @author msyabro
 * @reviewer iefremov
 * @needsreview Current spec does not specify the behavior of >>>= on non-integers.
 */

class A {
  static var i;
}


void main() {
  A.i = -2;
  Expect.isTrue( (A.i >>>= 3) == 536870911);
}
