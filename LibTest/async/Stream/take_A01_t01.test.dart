/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> take(int count)
 * Provides at most the first n values of this stream.
 * Forwards the first n data events of this stream, and all error events,
 * to the returned stream, and ends with a done event.
 * If this stream produces fewer than count values before it's done,
 * so will the returned stream.
 * @description Checks that at most n elements are returned.
 * @author kaigorodov
 */
library take_A01_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, List<T> expected, int count) {
  List<T> actual = [];
  asyncStart();
  s.take(count).listen(
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
  check(create([null]),[], 0);
  check(create([null]),[null], 1);
  check(create([null]),[null], 2);
  check(create([1, 2, 3]), [], 0);
  check(create([1, 2, 3]), [1], 1);
  check(create([1, 2, 3]), [1, 2], 2);
  check(create([1, 2, 3]), [1,2,3], 12);
  check(create([[], [[]], [[[]]]]), [[], [[]]], 2);
}
