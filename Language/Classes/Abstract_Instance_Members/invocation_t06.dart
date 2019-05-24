/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Invoking an abstract method, getter or setter results in an
 * invocation of noSuchMethod exactly as if the declaration did not exist,
 * unless a suitable member a is available in a superclass, in which case a is
 * invoked.
 * @description Checks that invoking an abstract method that is inherited from
 * non-direct superclass results in invoking noSuchMethod method. Test type
 * aliases
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../../Utils/expect.dart";

abstract class A {
  int m1();
  int noSuchMethod(Invocation invocation) => 42;
}
typedef AAlias = A;

abstract class A1 extends A {}
typedef A1Alias = A1;
abstract class A2 extends A1 {}
typedef A2Alias = A2;
class C extends A2Alias {
}

main() {
  int v = new C().m1();
  Expect.equals(42, v);
}

