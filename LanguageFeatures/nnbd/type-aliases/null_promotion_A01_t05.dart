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
 * Test pre-NNBD legacy types and type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
import "legacy_library_aliases_lib.dart" as legacy;

dynamic init() => null;

typedef AAlias = legacy.A?;

main() {
  AAlias a1 = init();
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

  legacy.AAlias? a2 = init();
  if (a2 is Null) {
    a2.bar();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  if (a2 == null) {
    a2.bar();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
