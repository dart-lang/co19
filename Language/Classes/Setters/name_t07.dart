/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A setter declaration may conflict with other declarations (10.11).
 * Let C be a class. It is a compile-time error if C declares a
 * • constructor named C.n and a static member with basename n.
 * • getter or a setter with basename n, and has a method named n.
 * • method named n, and has a getter or a setter with basename n.
 * • static member with basename n, and has an instance member with basename n.
 *
 * @description Checks that there is a compile-time error if a class has
 * an explicitly defined setter and an static method with the same name.
 * @compile-error
 * @author iefremov
 */

class C {
  void set foo(var x) {}
  static foo(var z) {}
}

main() {
  C c = new C();
  C.foo(1);
  c.foo = 1;
}
