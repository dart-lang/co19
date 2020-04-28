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
  late final int? y;
}
class B extends A {
  int get x => 1;
  int? get y => 1;
}
class C extends A {
  late final int x = 2;
  late final int? y = 2;
}

void main() {
  B b = new B();
  b.x = 3;
  Expect.throws(() => b.x = 14, (e) => e is LateInitializationError);

  C c = new C();
  c.x = 1;
  Expect.throws(() => c.x = 3, (e) => e is LateInitializationError);

  b.y = 3;
  Expect.throws(() => b.y = 14, (e) => e is LateInitializationError);
  c.y = 1;
  Expect.throws(() => c.y = 3, (e) => e is LateInitializationError);
}
