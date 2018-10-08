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
 * this stream, including errors.
 * @author a.semenov@unipro.ru
 */
library timeout_A01_t02;
import "dart:async";
import "../../../Utils/expect.dart";

const Duration _10DAYS = const Duration(days:10);

void check<T>(Stream<T> s, List<T> expectedData, List expectedErrors) {
  AsyncExpect.events(expectedData, expectedErrors, s.timeout(_10DAYS));
}

void test(CreateStreamWithErrorsFunction create) {
  check(create([1,2,3,4,5], isError: (x) => true), [], [1,2,3,4,5]);
  check(create([1,2,3,4,5], isError: (x) => x.isEven), [1,3,5], [2,4]);
  check(create([1,2,3,4,5], isError: (x) => x.isOdd), [2,4], [1,3,5]);
}
