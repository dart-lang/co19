/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply to methods
 * apply to abstract methods.
 * 7.1: It is a compile-time error if an instance method m1 overrides an instance
 * member m2 and m1 does not declare all the named parameters declared by m2 in the same order.
 * @description Checks that a compile-time error is produced when the overriding non-abstract 
 * instance method has almost the same set of named parameters as the abstract method being overriden, 
 * except for one that has a different name.
 * @compile-error
 * @static-warning
 * @author rodionov
 * @reviewer iefremov
 */

class A {
  f([var x, var y, var z]);
}

class C extends A {
  f([var x, var yy, var z]) {}
}

main() {
  try {
    new A().f(1, 2, 3);
  } catch (e) {}
  try {
    new C().f(1, 2, 3);
  } catch (e) {}

}

