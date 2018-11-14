/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if an abstract member m is declared or
 * inherited in a concrete class C unless:
 *  • m overrides a concrete member, or
 *  • C has a noSuchMethod() method distinct from the one declared in class
 *    Object.
 * @description Checks that there is no a compile error when a class declares
 * an abstract or concrete method with the same name as a static method in its
 * superclass even if their signatures are deeply different.
 * @issue 27476
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
