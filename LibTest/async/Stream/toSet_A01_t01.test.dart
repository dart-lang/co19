/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Set<T>> toSet()
 * Collects the data of this stream in a Set.
 * @description Checks that returned set contains all elements of the stream.
 * @author kaigorodov
 */
library toSet_A01_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.value(new Set.from([]), create([]).toSet());
  AsyncExpect.value(new Set.from([1, 2, 3]), create([1, 2, 3]).toSet());
  Set data = new Set.from([[], [[]], [[[]]]]);
  AsyncExpect.value(data, create(data).toSet());
  AsyncExpect.value(new Set.from(["1", 2, null]), create(["1", 2, null]).toSet());

  AsyncExpect.value(new Set.from([1]), create([1,1,1]).toSet());
  AsyncExpect.value(new Set.from([1,2,3]), create([1,2,3,1,2,3]).toSet());
  AsyncExpect.value(
      new Set.from([-1, -2, -3, 1, 2, 3]),
      create([-1, -2, -3, 1, 2, 3, -1, -2, -3]).toSet()
  );
}
