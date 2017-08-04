/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> distinct([bool equals(T previous, T next)])
 *    Skips data events if they are equal to the previous data event.
 *    The returned stream provides the same events as this stream, except that it
 * never provides two consecutive data events that are equal.
 * @description Checks that errors in original stream are copied to the returned
 * stream. [equals] is omitted.
 * @issue #29627
 * @author a.semenov@unipro.ru
 */
library distinct_A04_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(Stream<T> s, List<T> expectedData, List expectedErrors) {
  Stream d = s.distinct();
  List data = [], errors = [];
  asyncStart();
  d.listen(
    (event) {
      data.add(event);
    },
    onError: (error) {
      errors.add(error);
    },
    onDone:() {
      Expect.listEquals(expectedData, data);
      Expect.listEquals(expectedErrors, errors);
      asyncEnd();
    }
  );
}

void test(Stream<T> create(Iterable<T> data, {bool isError(T x)})) {
  check(create([]), [], []);
  check(create([1, 2, 2, 3], isError:(e) => e.isEven), [1,3],[2,2]);
  check(create([1, 1, 2, 2, 3, 3], isError:(e) => e.isEven), [1,3],[2,2]);
  check(create([1, 1, 2, 2, 3, 3], isError:(e) => e.isOdd), [2],[1,1,3,3]);
  check(create([1, 2, null, null], isError:(e) => e is num), [null], [1,2]);
}
