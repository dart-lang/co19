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
 * the case <T extends num?>
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class C<T extends num?> {
  T t;
  C(this.t);

  test() {
    t.isFinite;
//    ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    t.abs();
//    ^^^^
// [analyzer] unspecified
// [cfe] unspecified

    t + t;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  C<int?> c = new C<int?>(3);
  c.test();
}
