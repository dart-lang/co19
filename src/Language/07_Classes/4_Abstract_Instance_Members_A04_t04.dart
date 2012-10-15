/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply to methods
 * apply to abstract methods.
 * 7.1: It is a compile-time error if an instance method m1 overrides an instance
 * member m2 and m1 does not declare all the named parameters declared by m2.
 * @description Checks that no compile-time error is produced when the overriding abstract method
 * has the same set of named parameters as the non-abstract instance method being overriden,
 * but in a different order.
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 * @issue 978
 */

class A {
  f({var x, var y}) { return x+y; }
}

class C extends A {
  abstract f({var y, var x});
}

main() {
  try {
    new A().f(x:1, y:2);
    new C().f(x:2, y:1);
  } catch (e) {}
}
