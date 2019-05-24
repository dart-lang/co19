/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply
 * to methods apply to abstract methods.
 * It is a compile error if an instance method m1 overrides an instance member
 * m2 and the type of m1 is not a subtype of the type of m2.
 * @description Checks that a compile error is produced when the type of a
 * non-abstract m1 is not a subtype of the abstract m2's type because their
 * respective required parameter types are not mutually assignable even if the
 * class declaring the first method is not a direct subclass of the other.
 * @compile-error
 * @author rodionov
 */

abstract class A {
  foo(int x);
}

abstract class B extends A {
}

class C extends B {
  foo(String x) {
  }
}

main() {
  new C().foo("1");
}

