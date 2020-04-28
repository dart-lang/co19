/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A non-local late variable declaration D implicitly induces a
 * getter into the enclosing scope. It also induces an implicit setter iff one
 * of the following conditions is satisfied:
 * - D is non-final.
 * - D is late, final, and has no initializing expression.
 *
 * @description Check overriding of an implicit setter
 * @author sgrekhov@unipro.ru
 * @issue 40391
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

class A {
  late final int x;
}
class B extends A {
  int x = 3;
}
class C extends A {
  late final int x = 3;
}

void main() {
  B b = new B();
  b.x = 3;
  b.x = 14;

  A a = new B();
  a.x = 42;
  a.x = 41;

  C c = new C();
  c.x = 1;
  Expect.throws(() => c.x = 3);
}
