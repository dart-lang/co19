/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a compile error if an abstract member m is declared or
 * inherited in a concrete class C unless:
 *  - m overrides a concrete member, or
 *  - C has a noSuchMethod() method distinct from the one declared in class
 *    Object.
 * @description Checks that there is no compile error if an abstract
 * method is declared in a concrete class and it overrides a concrete method.
 * Test type aliases
 * @static-clean
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
class A {
  foo([x]) {}
}
typedef AAlias = A;

class B extends AAlias {
  foo([x]);
}

main() {
  new B();
}
