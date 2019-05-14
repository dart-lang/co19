/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile error if an instance method m1 overrides an
 * instance member m2 and the type of m1 is not a subtype of the type of m2.
 * @description Checks that a compile error is produced when the type of the
 * overriding method is not a subtype of the method being overridden even if 
 * the class declaring m1 is not a direct subtype of the class declaring m2.
 * @compile-error
 * @author iefremov
 */

class A {
  foo(double name) {}
}

class A1 extends A{}
class A2 extends A1{}
class A3 extends A2{}

class C extends A3 {
  foo(int name) {}
}

main() {
  new A().foo(1.0);
  new C().foo(0);
}
