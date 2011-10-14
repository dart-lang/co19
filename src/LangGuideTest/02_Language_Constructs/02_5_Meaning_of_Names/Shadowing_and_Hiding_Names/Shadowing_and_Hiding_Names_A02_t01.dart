/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Formal parameters of constructors are implicitly final.
 * @description Checks that parameters of constructor are final.
 * @compile-error
 * @author msyabro
 * @reviewer pagolubev
 */

class A {
  A(x) {
    x = 1;
  }
}


main() {}
