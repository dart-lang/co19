/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is no static warning if an instance method m1 overrides an
 * instance member m2 and m1 does not declare all the named parameters declared 
 * by m2.
 * @description Checks that there are no static warnings if m1 has the same set 
 * of named parameters as m2 but in a different order when the class declaring 
 * m1 is not a direct subtype of the class declaring m2. Test type aliases
 * @static-clean
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A {
  f({var x, var y}) { return x + y; }
}
typedef AAlias = A;

class A1 extends AAlias {}
typedef A1Alias = A1;
class A2 extends A1Alias{}
typedef A2Alias = A2;
class A3 extends A2Alias{}
typedef A3Alias = A3;

class C extends A3Alias {
  f({var y, var x}) { return x + y; }
}

main() {
  new A().f(x: 1, y: 2);
  new C().f(x: 2, y: 1);
}
