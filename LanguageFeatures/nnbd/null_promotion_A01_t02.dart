/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A check of the form [e == null] or of the form [e is Null] where
 * [e] has static type [T] promotes the type of [e] to [Null] in the [true]
 * continuation, and to [NonNull(T)] in the [false] continuation.
 *
 * @description Check that [e] is promoted to [Null] in the [true] condition.
 * Test [e is Null] expression
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

dynamic init() => null;

main() {
  A? a = init();
  if (a is Null) {
    a.foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  B? b1 = init();
  if (b1 is Null) {
    b1.bar();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  B<int>? b2 = init();
  if (b2 is Null) {
    b2.bar();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int? i = init();
  if (i is Null) {
    i.isOdd;
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
