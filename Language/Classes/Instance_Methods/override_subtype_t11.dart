/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is no static warning if an instance method m1 overrides an
 * instance member m2 and the type of m1 is not a subtype of the type of m2.
 * @description Checks that there are no warnings when type of m1 is in fact
 * a subtype of type of m2. Checks instance methods with no optional
 * parameters. Test type aliases
 * @static-clean
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class Super {}
class Sub extends Super {}

class A {
  num     f1() {}
  Super   f2() {}
  Super   f3() {}
  Sub     f4() {}

  int     f5(Super x) {}
  Super   f6(Super x) {}
  Super   f7(Sub x) {}
  Sub     f8(Super x) {}
}
typedef AAlias = A;

class C extends AAlias {
  int f1() {}
  Super   f2() {}
  Sub     f3() {}
  Sub   f4() {}

  int     f5(dynamic x) {}
  Super   f6(Super x) {}
  Super   f7(Super x) {}
  Sub     f8(Super x) {}
}

main() {
  new A();
  new C();
}
