/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The instance getters of a class C are those instance getters
 * declared by C, either implicitly or explicitly, and the instance getters
 * inherited by C from its superclass. The static getters of a class C are those
 * static getters declared by C.
 * A getter declaration may conflict with other declarations (10.11).
 * Let C be a class. It is a compile-time error if C declares a
 * • getter or a setter with basename n, and has a method named n.
 * • method named n, and has a getter or a setter with basename n.
 *
 * @description Checks that it is no compile-time error if a class has an
 * explicitly declared instance getter and an explicitly declared static setter
 * with the same name in its superclass.
 * @author ngl@unipro.ru
 */

class A {
  static int n;
  static set v(int v1) {
    n = v1;
  }
}

class C extends A {
  get v {
    return 5;
  }
}

main() {
  new C().v;
}
