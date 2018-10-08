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
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.value([], create([]).toList());
  AsyncExpect.value(
      [-1, -2, -3, 1, 2, 3, -1, -2, -3],
      create([-1, -2, -3, 1, 2, 3, -1, -2, -3]).toList()
  );
  AsyncExpect.value([1, 2, 3], create([1, 2, 3]).toList());
  AsyncExpect.value([[], [[]], [[[]]]], create([[], [[]], [[[]]]]).toList());
  AsyncExpect.value(["1", 2, null], create(["1", 2, null]).toList());
}
