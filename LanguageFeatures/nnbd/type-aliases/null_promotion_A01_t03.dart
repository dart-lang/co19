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
 * Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong

class A {
  foo() {}
}

typedef AAlias1 = A?;
typedef AAlias2 = AAlias1?;

dynamic init() => null;

main() {
  AAlias1 a1 = init();
  if (a1 is Null) {
    a1.foo();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  if (a1 == null) {
    a1.foo();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  AAlias2? a2 = init();
  if (a2 is Null) {
    a2.foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  if (a2 == null) {
    a2.foo();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
