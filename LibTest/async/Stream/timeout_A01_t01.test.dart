/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream timeout(Duration timeLimit,
 *                           {void onTimeout(EventSink sink)})
 * Creates a new stream with the same events as this stream.
 *
 * @description Check that timeout creates a new stream with the same events as
 * this stream.
 * @author ngl@unipro.ru
 */
library timeout_A01_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, List<T> expectedData) {
  List<T> actualData = [];
  asyncStart();

  s.timeout(new Duration(days:10)).listen(
    (event) {
      actualData.add(event);
    },
    onDone: () {
      Expect.listEquals(expectedData, actualData);
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create([]), []);
  check(create([1, 2, 3, null]), [1, 2, 3, null]);
  List<int> data = new List<int>.generate(10, (int index) => index * 2);
  check(create(data), data);
  check(create(["a", "b", "c", 3.14, 100]), ["a", "b", "c", 3.14, 100]);
}
