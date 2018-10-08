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
 * @description Checks that all error events (which occur before the returned
 * stream is done) are submitted to the returned stream.
 * Checks that the resulting stream ends with a done event.
 * @author a.semenov@unipro.ru
 */
library takeWhile_A01_t02;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, bool test(T element),
           List<T> expectedData, List expectedErrors) {
  AsyncExpect.events(expectedData, expectedErrors, s.takeWhile(test));
}

void test(CreateStreamWithErrorsFunction create) {
  check(create([1, 2, 3], isError: (_) => true), (x) => false, [], [1, 2, 3]);
  check(create([1, 2, 3], isError: (_) => true), (x) => true, [], [1, 2, 3]);


  check(create([1, 2, 3, 4, 5], isError: (x) => x.isOdd), (x) => false, [], [1]);
  check(create([1, 2, 3, 4, 5], isError: (x) => x.isOdd), (x) => x<4, [2], [1,3]);
  check(create([1, 2, 3, 4, 5], isError: (x) => x.isEven), (x) => false, [], []);
  check(create([1, 2, 3, 4, 5], isError: (x) => x.isEven), (x) => x<4, [1,3], [2,4]);

  check(create([1, 2, 3, 4, 5], isError: (x) => x<4), (x) => true, [4, 5], [1, 2, 3]);
  check(create([1, 2, 3, 4, 5], isError: (x) => x<4), (x) => false, [], [1, 2, 3]);
  check(create([1, 2, 3, 4, 5], isError: (x) => x<4), (x) => x>2, [4,5], [1, 2, 3]);
  check(create([1, 2, 3, 4, 5], isError: (x) => x>2), (x) => x<3, [1, 2], [3,4,5]);
}
