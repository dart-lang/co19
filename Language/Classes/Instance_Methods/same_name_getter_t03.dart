/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A method declaration may conflict with other declarations (10.11).
 * Let C be a class. It is a compile-time error if C declares a
 * • constructor named C.n and a static member with basename n.
 * • getter or a setter with basename n, and has a method named n.
 * • method named n, and has a getter or a setter with basename n.
 * • static member with basename n, and has an instance member with basename n.
 *
 * @description Checks that it is a compile error if a class C declares an
 * instance method named n and an inherited instance getter named n. Test type
 * aliases
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A {
  get foo {}
}
typedef AAlias = A;

class C extends AAlias {
  foo() {}
}

main() {
  try {
    C c = new C();
    c.foo();
  } catch (anything) {}
}
