/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a  static warning if an instance method m1 overrides an
 * instance member m2 and m1 has a greater number of required parameters than 
 * m2.
 * @description Checks that a static warning is produced if m2 has one required
 * parameter and m1 has two required parameters.
 * @static-warning
 * @author vasya
 * @reviewer iefremov
 * @reviewer rodionov
 */

class A {
  f(var x) { return x; }
}

class C extends A {
  f(var x, var y) { return x + y; } /// static warning
}

main() {
  new A().f(2);
  new C().f(2, 2);
}
