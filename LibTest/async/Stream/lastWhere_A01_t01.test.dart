/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> lastWhere (bool test(T element),
 *     {@deprecated dynamic defaultValue(),  T orElse()})
 *
 * Finds the last element in this stream matching test.
 *
 * If this stream emits an error, the returned future is completed with that
 * error, and processing stops.
 *
 * Otherwise as firstWhere, except that the last matching element is found
 * instead of the first. That means that a non-error result cannot be provided
 * before this stream is done.
 *
 * The defaultValue parameter is deprecated, and orElse should be used instead.
 * @description Checks that if element is found, it is passed to the resulting
 * future. [orElse] is omitted.
 * @author a.semenov@unipro.ru
 */
library lastWhere_A01_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.value(3, create([1, 2, 3]).lastWhere((element) => true));
  AsyncExpect.value(3, create([1, 2, 3]).lastWhere((element) => element != null));
  AsyncExpect.value(null, create([1, 2, 3, null]).lastWhere((e) => e == null));
  AsyncExpect.value(3, create([1, 2, 3]).lastWhere((element) => element > 0));
  AsyncExpect.value(
      45,
      create(new Iterable.generate(10, (int index) => index * 5))
        .lastWhere((int element) => element != 30)
  );
  AsyncExpect.value(
      30,
      create(new Iterable.generate(10, (int index) => index * 5))
        .lastWhere((int element) => element == 30)
  );
}
