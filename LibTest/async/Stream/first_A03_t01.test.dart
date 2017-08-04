/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> first
 * If an error event occurs before the first data event, the resulting
 * future is completed with that error.
 * @description Checks that if error event occurs before the first data
 * event, the future completes with that error.
 * @author ilya
 */
library first_A03_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void test(Stream<T> create(Iterable<T> data, {bool isError(T x)})) {
  Stream s = create([1,2,3], isError:(_)=>true);
  asyncStart();
  s.first.then(
      (data) {
        Expect.fail("The returned future should complete with error");
      },
      onError:(error) {
        Expect.equals(1, error);
        asyncEnd();
      }
  );
}
