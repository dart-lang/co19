/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call a method, setter, getter or operator on
 * an expression whose type is potentially nullable and not dynamic, except for
 * the methods, setters, getters, and operators on Object.
 *
 * @description Check that it is a compile-time error to call a method, setter,
 * getter or operator on an expression whose type is potentially nullable. Test
 * the case <T extends A?>
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A {
  String m = "";
  void foo() {}
  int get g => 1;
  void set s(int i) {}
  A operator+(A other) => other;
}

class C<T extends A?> {
  T a;
  C(this.a);

  test() {
    a.m;
//   ^^
// [analyzer] unspecified
// [cfe] unspecified

    a.foo();
//   ^^^^
// [analyzer] unspecified
// [cfe] unspecified

    a.g;
//   ^^
// [analyzer] unspecified
// [cfe] unspecified

    a.s = 2;
//   ^^
// [analyzer] unspecified
// [cfe] unspecified

    a + a;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  C<A?> c = new C<A?>(new A());
  c.test();
}
