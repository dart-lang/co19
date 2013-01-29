/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply to methods
 * apply to abstract methods.
 * 7.1: It is a static warning if a class C declares an instance method
 * named n and an accessible static member named n is declared in a superclass of C.
 * @description Checks that a static warning is produced when a class declares an abstract
 * method with the same name as a static method in its superclass.
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 */

class A {
  static f() {}
}

abstract class B extends A {
  f(); /// static type warning
}

class C extends B {
  f(){} /// static type warning
}

main() {
  new C().f();
}

