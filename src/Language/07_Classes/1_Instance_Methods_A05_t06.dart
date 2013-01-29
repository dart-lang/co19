/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a class C declares an instance method
 * named n and an accessible static member named n is declared in a superclass of C.
 * @description Checks that a static warning is produced when a class declares an instance
 * method with the same name as a static method in its superclass even if their signatures
 * are wildly different.
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 */

class A {
  static double f() {}
}

class C extends A {
  bool f(int x, [String xx]) { /// static type warning
  }
}

main() {
  (new C()).f(1, "");
}

