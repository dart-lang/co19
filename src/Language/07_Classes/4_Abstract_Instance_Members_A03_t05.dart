/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply to methods
 * apply to abstract methods.
 * 7.1: It is a compile-time error if an instance method m1 overrides (7.9.1) an
 * instance member m2 and m1 has a different number of required parameters than m2.
 * @description Checks that a compile-error is produced when the overriding abstract method 
 * has one optional parameter and the abstract method being overridden has 1 required parameter 
 * and 1 optional parameter of the same name.
 * @compile-error
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 */

class A {
  f(var x, [var xx]);
}

class C extends A {
  f([var xx]);
}

main() {
  try {
    new A().f(1);
    new C().f(1);
  } catch (e) {}
}

