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
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream<T> s, List<T> expectedData) {
  asyncStart();
  s.toList().then((value) {
    Expect.setEquals(expectedData, value);
    asyncEnd();
  });
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([]), []);
  check(create([-1, -2, -3, 1, 2, 3, -1, -2, -3]), [-1, -2, -3, 1, 2, 3, -1, -2, -3]);
  check(create([1, 2, 3]), [1, 2, 3]);
  var data = [[], [[]], [[[]]]];
  check(create(data), data);
  check(create(["1", 2, null]),["1", 2, null]);
}
