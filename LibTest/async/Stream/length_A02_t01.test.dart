/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<int> length
 *    If the stream contains an error, the returned future is completed with
 * that error, and processing stops.
 * @description Checks that If the stream contains an error, the returned
 * future is completed with that error, and processing stops
 * @author a.semenov@unipro.ru
 */
library length_A02_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s, Object expected) {
  asyncStart();
  s.length.then(
    (value) {
      Expect.fail("Returned future should complete with error");
    },
    onError:(error) {
      Expect.equals(expected, error);
      asyncEnd();
    }
  );
}

void test(CreateStreamWithErrorsFunction create) {
  check(create([1], isError:(_) => true), 1);
  check(create([1, 2, 3, null], isError:(e) => e==3), 3);
  check(
      create(
          new Iterable.generate(10, (int index) => index * 2),
          isError:(e) => e > 10
      ),
      12
  );
}
