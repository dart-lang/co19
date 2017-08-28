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
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, List<T> expectedData, List expectedErrors) {
  List<T> actualData = [];
  List<T> actualErrors = [];
  asyncStart();
  s.timeout(new Duration(days: 10)).listen(
      (value) {
        actualData.add(value);
      },
      onError: (error) {
        actualErrors.add(error);
      },
      onDone: () {
        Expect.listEquals(expectedErrors, actualErrors);
        Expect.listEquals(expectedData, actualData);
        asyncEnd();
      }
  );
}

void test(CreateStreamWithErrorsFunction create) {
  check(create([1,2,3,4,5], isError: (x) => true), [], [1,2,3,4,5]);
  check(create([1,2,3,4,5], isError: (x) => x.isEven), [1,3,5], [2,4]);
  check(create([1,2,3,4,5], isError: (x) => x.isOdd), [2,4], [1,3,5]);
}
