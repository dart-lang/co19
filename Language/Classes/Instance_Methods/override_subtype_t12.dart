/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is no static warning if an instance method m1 overrides an
 * instance member m2 and the type of m1 is not a subtype of the type of m2.
 * @description Checks that there are no warnings when type of m1 is in fact
 * a subtype of type of m2. Checks instance methods with optional parameters.
 * @static-clean
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class Whatever {}
class Super {}
class Sub extends Super {}

class A {
  num f1(Super x, Sub y, [Super a]) {}
  int f2(Super x, Sub y, [Sub a]) {}
  dynamic f3(Super x, {Sub a}) {}
}
typedef AAlias = A;

class C extends AAlias {
  int f1(Super x, [Super a, Super b]) {}
  int f2(Super x, [Sub a, Super b, Whatever c]) {}
  int f3(Super x, {Super a, Super b}) {}
}

main() {
  new A();
  new C();
}
