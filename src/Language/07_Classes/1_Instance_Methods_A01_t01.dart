/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an instance method m1 overrides (7.8.1) an
 * instance member m2 and m1 has a different number of required parameters than m2.
 * @description Checks that a compile-error is produced if m2 has one required parameter and m1 has two required parameters.
 * @compile-error
 * @author vasya
 * @reviewer iefremov
 * @reviewer rodionov
 */

class A {
  f(var x) { return x; }
}

class C extends A {
  f(var x, var y) { return x + y; }
}

main() {
  try {
    new A().f(2);
    new C().f(2, 2);
  } catch(var x) {}
}

