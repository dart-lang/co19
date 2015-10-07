/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a class C declares an instance method
 * named n and an accessible static member named n is declared in a superclass 
 * of C.
 * @description Checks that a static warning is produced when a class declares 
 * an instance method with the same name as a static method in its superclass.
 * @static-warning
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 */

class A {
  static f() {}
}

class C extends A {
  f() { /// static type warning
  }
}

main() {
  new C().f();
}

