/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile error if an instance method m1 overrides an
 * instance member m2 and the type of m1 is not a subtype of the type of m2.
 * @description Checks that a compile error is produced if the return type of
 * m1 is not mutually assignable with the return type of m2 and the latter 
 * isn't void either.
 * @compile-error
 * @author iefremov
 */

class A {
  int foo(var x) {}
}

class C extends A {
  String foo(var x) {
    return x.toString();
  }
}

main() {
  new A().foo(2);
  new C().foo(1);
}
