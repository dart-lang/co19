/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an instance method m1 overrides (7.9.1) an
 * instance member m2 and m1 has a different number of required parameters than m2.
 * @description Checks that a compile-error is produced if m2 has 5 required parameters and m1 has a single required parameter.
 * @compile-error
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 */

class A {
  f(var x, var x2, var x3, var x4, var x5) { }
}

class C extends A {
  f(var x) { }
}

main() {
  try {
    new A().f(1,2,3,4,5);
    new C().f(0);
  } catch (e) {}
}

