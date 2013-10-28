/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a  static warning if an instance method m1 overrides (7.9.1) an
 * instance member m2 and m1 has a greater number of required parameters than m2.
 * @description Checks that a static warning is produced if m2 has no parameters and m1 has a single required parameter.
 * @static-warning
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 */

class A {
  f() { }
}

class C extends A {
  f(var x) { } /// static warning
}

main() {
  new A().f();
  new C().f(1);
}

