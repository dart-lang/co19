/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> elementAt(int index)
 * If an error event occurs before the value is found, the future completes
 * with this error.
 * @description Checks that if an error event occurs before the value is found,
 * the future will end with this error.
 * @author kaigorodov
 */
library elementAt_A02_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void checkError(Stream s, int index, Object expected) {
  asyncStart();
  s.elementAt(index).then(
    (actual) {
      Expect.fail("Returned future should complete with error");
    },
    onError: (error) {
      Expect.equals(expected, error);
      asyncEnd();
    }
  );
}

void test(CreateStreamWithErrorsFunction create) {
  for (int k=0; k<10; k++) {
    Iterable i = new Iterable.generate(10, (x) => x);
    Stream s = create(i, isError:(e) => e==k);
    checkError(s, k, k);
  }
}
