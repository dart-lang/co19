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
 * Test pre-NNBD legacy types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "legacy_lib.dart";

dynamic init() => null;

main() {
  A? a = init();
  if (a is Null) {
    a.foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  if (a == null) {
    a.foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
