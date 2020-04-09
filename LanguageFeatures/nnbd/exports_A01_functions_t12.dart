/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If an unmigrated library re-exports a migrated library, the
 * re-exported symbols retain their migrated status (that is, downstream
 * migrated libraries will see their migrated types).
 * @description Check that if generic function with nullable type parameter is
 * exported from opted-in library to legacy library and then back to the opted
 * in code, it retains its status and so can accept [Null] as a type parameter.
 * @Issue 40399
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "dart:async";
import "../../Utils/expect.dart";
import "exports_A01_opted_out_lib.dart";

main() {
  Expect.isTrue(testGenericDynamic is void Function<T extends dynamic>());
  testGenericDynamic<Null>();

  Expect.isTrue(testGenericNullableInt is void Function<T extends int?>());
  testGenericNullableInt<Null>();

  Expect.isTrue(testGenericNullableFunction is void Function<T extends Function?>());
  testGenericNullableFunction<Null>();

  Expect.isTrue(testGenericNullableObject is void Function<T extends Object?>());
  testGenericNullableObject<Null>();

  Expect.isTrue(testGenericNull is void Function<T extends Null>());
  testGenericNull<Null>();
  testGenericNull();

  Expect.isTrue(testGenericFutureOr is void Function<T extends FutureOr>());
  testGenericFutureOr<Null>();
}
