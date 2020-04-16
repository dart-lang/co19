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
 * condition. Test pre-NNBD legacy types and type aliases
 * @author iarkh@unipro.ru
 * @issue 41494
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-weak
import "legacy_library_aliases_lib.dart" as legacy;

dynamic init(x) => x;

typedef AAlias = legacy.A?;

main() {
  AAlias a1 = init(legacy.A());
  if (a1 is Null) {
  } else {
    a1.foo();
    AAlias a11 = a1;
  }

  if (a1 == null) {
  } else {
    a1.foo();
    AAlias a11 = a1;
  }

  legacy.AAlias? a2 = init(legacy.A());
  if (a2 is Null) {
  } else {
    a2.bar();
    legacy.AAlias a22 = a2;
  }

  if (a2 == null) {
  } else {
    a2.bar();
    legacy.AAlias a22 = a2;
  }
}
