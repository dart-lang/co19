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
 * @description Checks that errors thrown by [equals] are added to the returned
 * stream.
 * @issue #29627
 * @author a.semenov@unipro.ru
 */
library distinct_A05_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream<T> s, bool equals(T previous, T next),
           List expectedData, List expectedErrors) {
  Stream d = s.distinct(equals);
  List data = [], errors = [];
  asyncStart();
  d.listen(
    (event) {
      data.add(event);
    },
    onError: (error, st) {
      errors.add(error);
    },
    onDone:() {
      Expect.listEquals(expectedData, data);
      Expect.listEquals(expectedErrors, errors);
      asyncEnd();
    }
  );
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([]), (p, n) => throw "error", [], []);
  check(create([1,2,3]), (p, n) => throw "a", [1], ["a","a"]);
  check(create([1,2,3,4,5]), (p, n) => n.isOdd ? throw n : p==n, [1,2,4], [3,5]);
}
