/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> handleError(Function onError, {bool test(error)})
 *    If a broadcast stream is listened to more than once, each subscription will
 * individually perform the test and handle the error.
 * @description Checks that [test] and [onError] are called once per listener
 * per error.
 * @author a.semenov@unipro.ru
 */
library handleError_A07_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamWithErrorsFunction create) {
  Stream s = create(["a", 1, "b", 2, "c", 3], isError: (x) => x is num);
  Map onErrorCalls = new Map();
  Map testCalls = new Map();
  asyncStart();
  s = s.asBroadcastStream().handleError(
    (error) {
      onErrorCalls[error] = 1 + onErrorCalls.putIfAbsent(error, () => 0);
    },
    test: (error) {
      testCalls[error] = 1 + testCalls.putIfAbsent(error, () => 0);
      return true;
    }
  );
  Future.wait([s.toList(), s.toList(), s.toList()]).then(
      (List<List> result) {
        result.forEach((r) => Expect.listEquals(["a", "b", "c"], r));
        Expect.equals(3, onErrorCalls.length);
        Expect.equals(3, testCalls.length);
        for (int e in [1, 2, 3]) {
          Expect.equals(3, onErrorCalls[e]);
          Expect.equals(3, testCalls[e]);
        };
        asyncEnd();
      }
  );
}
