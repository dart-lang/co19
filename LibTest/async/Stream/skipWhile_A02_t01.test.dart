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
 * @description Checks that error events in input stream are propagated
 * to the returned stream.
 * @author a.semenov@unipro.ru
 */
library skipWhile_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, bool test(T element),
           List<T> expectedData, List expectedErrors) {
  AsyncExpect.events(expectedData, expectedErrors, s.skipWhile(test));
}

void test(CreateStreamWithErrorsFunction create) {
  check(create([1,2,3], isError: (_) => true), (_) => false, [], [1,2,3]);
  check(create([1,2,3,4,5], isError: (x) => x.isOdd), (x) => x < 4, [4], [1,3,5]);
  check(create([1,2,3,4,5], isError: (x) => x.isOdd), (x) => x==1, [2,4], [1,3,5]);
  check(create([1,2,3,4,5], isError: (x) => x.isEven), (x) => x==1, [3,5], [2,4]);
  check(create([1,2,3,4,5], isError: (x) => x<5), (x) => x==5, [], [1,2,3,4]);
}
