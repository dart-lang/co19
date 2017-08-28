/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> skip(int count)
 * Skips the first count data events from this stream.
 * @description Checks that the first n elements are skipped.
 * @author kaigorodov
 */
library skip_A01_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, List<T> expected, int count) {
  List<T> actual = [];
  asyncStart();
  s.skip(count).listen(
    (value) {
      actual.add(value);
    },
    onDone: () {
      Expect.listEquals(expected, actual);
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create([]), [], 0);
  check(create([]), [], 1);
  check(create([]), [], 10);
  check(create([null]),[null], 0);
  check(create([null]),[], 1);
  check(create([null]),[], 2);
  check(create([1, 2, 3]), [1, 2, 3], 0);
  check(create([1, 2, 3]), [2, 3], 1);
  check(create([1, 2, 3]), [3], 2);
  check(create([1, 2, 3]), [], 12);
  check(create([[], [[]], [[[]]]]), [[[[]]]], 2);
}
