/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> elementAt(int index)
 * If a done event occurs before the value is found, the future completes with a
 * RangeError.
 * @description Checks that if a done event occurs before the value is found,
 * the future completes with a RangeError.
 * @author kaigorodov
 */
library elementAt_A03_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void checkError(Stream s, int index) {
  asyncStart();
  s.elementAt(index).then(
    (actual) {
      Expect.fail("Returned future should complete with error");
    },
    onError: (error) {
      Expect.isTrue(error is RangeError, "error is ${error.runtimeType}");
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  checkError(create([]), 1);
  for (int k = 1; k < 10; k++) {
    Iterable it = new Iterable.generate(k - 1, (int index) => index);
    checkError(create(it), k);
  }
}
