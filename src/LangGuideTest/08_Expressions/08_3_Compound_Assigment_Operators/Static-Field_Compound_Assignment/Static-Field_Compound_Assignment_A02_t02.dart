/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static-field compound assignment C.identifier OP= rhs is evaluated in a fashion that is equivalent to:
 * C.identifier = C.identifier OP rhs
 * @description Check that operator ^= works correctly
 * @author msyabro
 * @reviewer pagolubev
 */
 
class A {
  static var b;
}


main() {
  A.b = 1;
  Expect.isTrue( (A.b ^= 1) == 0);
}
