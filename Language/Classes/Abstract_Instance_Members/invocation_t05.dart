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
 * @description Checks that it is a compile error when calling an
 * abstract method that is inherited from non-direct superclass. Test type alias
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
abstract class A {
  m1();
}
typedef AAlias = A;
abstract class A1 extends AAlias {}
typedef A1Alias = A1;
abstract class A2 extends A1Alias {}
typedef A2Alias = A2;
class C extends A2Alias {
}

main() {
  new C().m1();
}

