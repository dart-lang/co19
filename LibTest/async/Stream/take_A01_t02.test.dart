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
 * @description Checks that all error events (which are before first n data
 * events) are submitted to the returned stream. Checks that the resulting
 * stream ends with a done event.
 * @author a.semenov@unipro.ru
 */
library take_A01_t02;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, int count, List<T> expectedData, List expectedErrors) {
  AsyncExpect.events(expectedData, expectedErrors, s.take(count));
}

void test(CreateStreamWithErrorsFunction create) {
  check(create([1, 2, 3], isError: (_) => true), 0, [], []);
  check(create([1, 2, 3], isError: (_) => true), 1, [], [1,2,3]);
  check(create([1, 2, 3], isError: (_) => true), 10, [], [1,2,3]);

  check(create([1, 2, 3, 4, 5], isError: (x) => x.isOdd), 10, [2,4], [1,3,5]);
  check(create([1, 2, 3, 4, 5], isError: (x) => x.isOdd), 2, [2,4], [1,3]);
  check(create([1, 2, 3, 4, 5], isError: (x) => x.isEven), 1, [1], []);
  check(create([1, 2, 3, 4, 5], isError: (x) => x.isEven), 2, [1,3], [2]);

  check(create([1, 2, 3, 4, 5], isError: (x) => x<4), 1, [4], [1, 2, 3]);
  check(create([1, 2, 3, 4, 5], isError: (x) => x>2), 2, [1, 2], []);
}
