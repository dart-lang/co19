/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> skipWhile(bool test(T element))
 * Skip data events from this stream while they are matched by test.
 * Error and done events are provided by the returned stream unmodified.
 * Starting with the first data event where test returns false for the event
 * data, the returned stream will have the same events as this stream.
 * @description Checks that elements matched by a test are skipped.
 * @author kaigorodov
 */
library skipWhile_A01_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, bool test(T element), List<T> expected) {
  List actual = [];
  asyncStart();
  s.skipWhile(test).listen(
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
  check(create([]), null, []);
  check(create([1, 2, 3]), (element) => false, [1, 2 ,3]);
  check(create([-1, -2, -3, 1, 2, 3]), (element) => element < 0, [1, 2 ,3]);
  check(create([1, 2, 3]), (element) => element == 1, [2, 3]);
  check(create([1, 2, 3]), (element) => true, []);
}
