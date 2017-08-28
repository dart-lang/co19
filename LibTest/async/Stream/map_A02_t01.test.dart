/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<S> map<S>(S convert(T event))
 *    For each data event, o, in this stream, the returned stream provides
 * a data event with the value convert(o). If convert throws, the returned
 * stream reports the exception as an error event instead.
 *
 * @description Checks that each error thrown by [convert] is passed to returned
 * stream.
 * @author a.semenov@unipro.ru
 */
library map_A02_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> stream, List<T> expectedData, List expectedErrors) {
  List actualData = [];
  List actualErrors = [];
  asyncStart();
  stream.listen(
      (data) {
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
  check(stream.map((e) => throw e), [], ["a", "b", "c"]);

  stream = create([1, 2, 3, 4, 5]);
  check(stream.map((e) => e.isOdd ? e : throw e), [1, 3, 5], [2, 4]);
}
