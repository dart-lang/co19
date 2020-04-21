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
 * or if T is a subtype of S. Test type aliases
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
import "../../../Utils/expect.dart";
class A {}
class C extends A {}

typedef AAlias = A;
typedef CAlias = C;

main() {
  dynamic d = "Lily was here";
  AAlias a1 = new A();
  AAlias a2 = new C();
  Expect.throws(() {
    AAlias a3 = d;
  });

  AAlias? a4 = new A();
  AAlias? a5 = new C();
  Expect.throws(() {
    AAlias? a6 = d;
  });
}
