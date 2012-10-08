/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A reference to a static constant variable is a constant expression.
 * @description Checks that a reference to a static final variable
 * cannot be assigned to a constant variable.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

class A {
  static final x = 1;
}

const i1 = x;

main() {
  try {
    print(i1);
  } catch(x) {}
}
