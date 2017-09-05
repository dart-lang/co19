/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future lastWhere(bool test(T element), {Object defaultValue()})
 * Finds the last element in this stream matching test.
 * As firstWhere, except that the last matching element is found.
 * That means that the result cannot be provided before this stream is done.
 * @description Checks that if element is found, it is passed to the resulting
 * future. [defaultValue] is omitted.
 * @author a.semenov@unipro.ru
 */
library lastWhere_A01_t01;
import "../../../Utils/async_utils.dart";

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
