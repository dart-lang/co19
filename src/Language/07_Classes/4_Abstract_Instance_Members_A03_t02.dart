/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply to methods
 * apply to abstract methods.
 * 7.1: It is a compile-time error if an instance method m1 overrides (7.8.1) an
 * instance member m2 and m1 has a different number of required parameters than m2.
 * @description Checks that a compile-error is produced when a non-abstract instance method overrides
 * an abstract method with the same name and a different number of required parameters.
 * @static-warning
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 * @reviewer kaigorodov
 * @issue 978
 */

abstract class A {
  f(var x);
}

class C extends A {
  f(var x, var y) {}
}

main() {
  try {
    new C().f(2);  /// static type warning missing argument
  } catch (e) {}
  
  try {
    new C().f(2, 2);
  } catch (e) {}
}

