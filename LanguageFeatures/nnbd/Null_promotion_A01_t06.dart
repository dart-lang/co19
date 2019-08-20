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
 * @description Check that [e] is promoted to [NonNull(T)] in the [false]
 * condition.
 * @author iarkh@unipro.ru
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

class A {
  foo() {}
}

class B<T> {
  bar() {}
}

main() {
  A? a = new A();
  if (a == null) {
  } else {
    a = null;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  B? b1 = new B();
  if (b1 == null) {
  } else {
    b1 = null;
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  B<int>? b2 = new B<int>();
  if (b2 == null) {
  } else {
    b2 = null;
//       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int? i = 42;
  if (i == null) {
  } else {
    i = null;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
