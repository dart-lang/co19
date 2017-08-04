/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> single
 * Returns the single element.
 * If an error event occurs before or after the first data event, the resulting
 * future is completed with that error.
 * @description Checks that an error event occurs before the first data event,
 * the resulting future is completed with that error.
 * @author ngl@unipro.ru
 */
library single_A03_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s, Object expected) {
  asyncStart();
  s.single.then(
    (_) {
      Expect.fail("Returned future sould complete with error");
    },
    onError: (error) {
      Expect.equals(expected, error);
      asyncEnd();
    }
  );
}

void test(Stream<T> create(Iterable<T> data, {bool isError(T x)})) {
  check(create([1,2,3], isError: (_) => true), 1);
  check(create([1,2,3], isError: (x) => x==1), 1);
  check(create([1,2], isError: (x) => x==2), 2);
  check(create([1,2,3], isError: (x) => x==2), 2);
}
