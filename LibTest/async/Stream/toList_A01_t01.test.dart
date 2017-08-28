/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List<T>> toList()
 * Collects the data of this stream in a List.
 * @description Checks that returned list contains all elements of the stream in
 * the same order.
 * @author kaigorodov
 */
library toList_A01_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, List<T> expectedData) {
  asyncStart();
  s.toList().then((value) {
      Expect.listEquals(expectedData, value);
      asyncEnd();
  });
}

void test(CreateStreamFunction create) {
  check(create([]), []);
  check(create([-1, -2, -3, 1, 2, 3, -1, -2, -3]), [-1, -2, -3, 1, 2, 3, -1, -2, -3]);
  check(create([1, 2, 3]), [1, 2, 3]);
  check(create([[], [[]], [[[]]]]), [[], [[]], [[[]]]]);
  check(create(["1", 2, null]),["1", 2, null]);
}
