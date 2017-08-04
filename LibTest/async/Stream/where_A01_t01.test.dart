/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> where(bool test(T event))
 * Creates a new stream from this stream that discards some data events.
 * The new stream sends the same error and done events as this stream, but it
 * only sends the data events that satisfy the test.
 * @description Checks that all stream events are checked by the test.
 * Checks that the stream sends only the data events that satisfy the test.
 * @author kaigorodov
 */
library where_A01_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream<T> s, bool test(T event), List<T> expectedData) {
  List actualData = [];
  asyncStart();
  s.where(test).listen(
    (value) {
      actualData.add(value);
    },
    onDone: () {
      Expect.listEquals(expectedData, actualData);
      asyncEnd();
    }
  );
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([1, 2, 3, null]), (int event) => event == null, [null]);
  check(create([1, 2, 3]), (int event) => event > 2, [3]);
  check(
      create(new Iterable.generate(10, (int index) => index * 5)),
      (int element) => element == 30,
      [30]
  );
  check(create([1, 2, 3, 4, 5]), (int event) => event.isOdd, [1,3,5]);
  check(create([1, 2, 3, 4, 5]), (int event) => event.isEven, [2,4]);
}
