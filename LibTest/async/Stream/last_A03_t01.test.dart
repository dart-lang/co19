/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> last
 * If an error event occurs before the first data event, the resulting future
 * is completed with that error.
 * @description Checks that if error event occurs before the first data
 * event, the future completes with that error.
 * @author ilya
 * @author a.semenov@unipro.ru
 */
library last_A03_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s, Object expectedError){
  asyncStart();
  s.last.then(
    (_) {
      Expect.fail("Returned future should complete with error");
    },
    onError: (error) {
      Expect.identical(expectedError, error);
      asyncEnd();
    }
  );
}

void test(Stream<T> create(Iterable<T> data, {bool isError(T x)})) {
  Error error = new Error();
  check(create([1, 2, error, 4, 5], isError: (e) => e is Error), error);
  check(create([error, 4, 5], isError: (e) => e is Error), error);
  check(create([1, 2, error], isError: (e) => e is Error), error);
}
