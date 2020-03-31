/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is assignable to a type S if T is dynamic, or if T is a
 * subtype of S.
 *
 * @description Checks that a type T is assignable to a type S if T is dynamic,
 * or if T is a subtype of S.
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";
class A {}
class C extends A {}

main() {
  dynamic d = "Lily was here";
  A a1 = new A();
  A a2 = new C();
  Expect.throws(() {
    A a3 = d;
  });

  A? a4 = new A();
  A? a5 = new C();
  Expect.throws(() {
    A? a6 = d;
  });
}
