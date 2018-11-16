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
 * an abstract or concrete method with the same name as a static variable in its
 * superclass.
 * @issue 27476
 * @author rodionov
 */

class A {
  static var f;
}

abstract class B extends A {
  f();
}

class C extends B {
  f() {}
}

main() {
  new C().f();
}
