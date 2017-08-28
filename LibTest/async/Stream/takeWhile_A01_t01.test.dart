/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> takeWhile(bool test(T element))
 * Forwards data events while test is successful.
 * The returned stream provides the same events as this stream as long as test
 * returns true for the event data.
 * The stream is done when either this stream is done, or when this stream first
 * provides a value that test doesn't accept.
 * @description Checks that only first elements that passed the test are
 * returned.
 * @author kaigorodov
 * @author a.semenov@unipro.ru
 */
library takeWhile_A01_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, bool test(T element), List<T> expectedData) {
  asyncStart();
  List actualData = [];
  s.takeWhile(test).listen(
    (value) {
      actualData.add(value);
    },
    onDone: () {
      Expect.listEquals(expectedData, actualData);
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create([]), null, []);
  check(create([-1, -2, -3, 1, 2, 3, -1, -2, -3]), (x) => x < 0, [-1, -2, -3]);
  check(create([1, 2, 3]), (element) => true, [1, 2, 3]);
  check(create([1, 2, 3, 1]), (element) => element == 1, [1]);
  check(create([1, 2, 3]), (element) => false, []);
}
