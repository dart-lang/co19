/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Stream asyncMap(dynamic convert(T event))
 * Creates a new stream with each data event of this stream asynchronously
 * mapped to a new event.
 *
 * This acts like map, except that convert may return a Future, and in that
 * case, the stream waits for that future to complete before continuing with
 * its result.
 *
 * Stream<S> map<S>(S convert(T event))
 * ...
 * Error and done events are passed through unchanged to the returned stream.
 *
 * @description Checks that each error thrown by [convert] is passed to returned
 * stream.
 * @author a.semenov@unipro.ru
 */
library asyncMap_A03_t02;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> stream, List<T> expectedData, List expectedErrors) {
  List<T> actualData = [];
  List actualErrors = [];
  asyncStart();
  stream.listen(
      (T data) {
        actualData.add(data);
      },
      onError: (error) {
        actualErrors.add(error);
      },
      onDone: () {
        Expect.listEquals(expectedData, actualData);
        Expect.listEquals(expectedErrors, actualErrors);
        asyncEnd();
      }
  );
}

void test(CreateStreamFunction create) {
  Stream stream = create(["a", "b", "c"]);
  check(stream.asyncMap((e) => throw e), [], ["a", "b", "c"]);

  stream = create([1, 2, 3, 4, 5]);
  check(stream.asyncMap((e) => e.isOdd ? e : throw e), [1, 3, 5], [2, 4]);
}
