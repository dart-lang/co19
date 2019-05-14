/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile error if an instance method m1 overrides an
 * instance member m2 and the type of m1 is not a subtype of the type of m2.
 * @description Checks that a compile error is produced when the type of the
 * overriding method is not a subtype of the method being overridden even if 
 * the class declaring m1 is not a direct subtype of the class declaring m2.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A {
  foo(double name) {}
}
typedef AAlias = A;
class A1 extends A{}
typedef A1Alias = A1;
class A2 extends A1{}
typedef A2Alias = A2;
class A3 extends A2{}
typedef A3Alias = A3;
class C extends A3Alias {
  foo(int name) {}
}

main() {
  new A().foo(1.0);
  new C().foo(0);
}
