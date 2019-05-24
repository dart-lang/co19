/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a compile error if an abstract member m is declared or
 * inherited in a concrete class C unless:
 *  - m overrides a concrete member, or
 *  - C has a noSuchMethod() method distinct from the one declared in class
 *    Object.
 * @description Checks that there is no compile error if an abstract setter
 * is declared in a concrete class and it overrides concrete instance setter.
 * @static-clean
 * @author ngl@unipro.ru
 */

class A {
  set foo(int v) {}
}

class C extends A {
  set foo(int v);
}

main() {
  new C();
}
