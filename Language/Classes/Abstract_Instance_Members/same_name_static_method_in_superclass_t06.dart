/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply
 * to methods apply to abstract methods.
 * It is a compile error if a class C declares an instance method named n and
 * an accessible static member named n is declared in a superclass of C.
 * @description Checks that a static warning is produced when a class declares
 * an instance method with the same name as a static method in its superclass
 * even if their signatures are deeply different.
 * @compile-error
 * @author rodionov
 */

class A {
  static double f() {}
}

abstract class B extends A {
  bool f(int x, [String xx]);
}

class C extends B {
  bool f(int x, [String xx]) {}
}

main() {
  new C().f(1, "");
}

