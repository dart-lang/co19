/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an instance method m1 overrides (7.8.1) an
 * instance member m2 and m1 has a different number of required parameters than m2.
 * @description Checks that a compile-error is produced if m2 has a single required parameter and m1 has no parameters.
 * @compile-error
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 */

class A {
  f(var x) { }
}

class C extends A {
  f() { }
}

main() {
  try {
    new A().f(1);
    new C().f();
  } catch(var x) {}
}

