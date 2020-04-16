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
 * condition. Test pre-NNBD legacy types
 * @author iarkh@unipro.ru
 * @issue 41494
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "legacy_lib.dart";

dynamic init(x) => x;

main() {
  A? a = init(A());
  if (a is Null) {
  } else {
    a.foo();
    A a1 = a;
  }

  if (a == null) {
  } else {
    a.foo();
    A a1 = a;
  }
}
