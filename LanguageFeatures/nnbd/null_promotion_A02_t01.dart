/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A check of the form [e != null] or of the form [e is T] where [e]
 * has static type [T?] promotes the type of [e] to [T] in the [true]
 * continuation, and to [Null] in the [false] continuation.
 *
 * @description Check that type of [e] is promoted to [Null] in the [false]
 * condition. Test [e != null] expression
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class A {
  foo() {}
}

class B<T> {
  bar() {}
}

main() {
  A? a = new A();
  if (a != null) {
  } else {
    a.foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  B? b1 = new B();
  if (b1 != null) {
  } else {
    b1.bar();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  B<int>? b2 = new B<int>();
  if (b2 != null) {
  } else {
    b2.bar();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int? i = 42;
  if (i != null) {
  } else {
    i.isOdd;
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
