/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
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
 * superclass. Test type aliases
 * @issue 27476
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A {
  static var f;
}
typedef AAlias = A;

abstract class B extends AAlias {
  f();
}
typedef BAlias = B;

class C extends BAlias {
  f() {}
}

main() {
  new C().f();
}
