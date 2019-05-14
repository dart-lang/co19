/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile error if an instance method m1 overrides an
 * instance member m2 and the type of m1 is not a subtype of the type of m2.
 * @description Checks that a compile error is produced if the return type of
 * m1 is not mutually assignable with the return type of m2 and the latter 
 * isn't void either. Test type alias
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A {
  int foo(var x) {}
}
typedef AAlias = A;

class C extends AAlias {
  String foo(var x) {
    return x.toString();
  }
}

main() {
  new A().foo(2);
  new C().foo(1);
}
