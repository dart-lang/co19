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
 * @description Checks that a compile-time error is produced when the overriding abstract method
 * has the same set of named parameters as the non-abstract instance method being overriden,
 * but in a different order.
 * @compile-error
 * @author rodionov
 */

class A {
  f([var x, var y]) { return x+y; }
}

class C extends A {
  abstract f([var y, var x]);
}

main() {
  try {
    new A().f(1,2);
    new C().f(2,1);
  } catch(var x) {}
}

