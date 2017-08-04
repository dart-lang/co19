/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> reduce(T combine(T previous, T element))
 * Reduces a sequence of values by repeatedly applying combine.
 * @description Checks that if the stream contains no elements, the combine
 * method is not called and the future returns an error.
 * @note undocumented
 * @author kaigorodov
 */
library reduce_A01_t03;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void test(Stream<T> create(Iterable<T> data)) {
  Stream s = create([]);
  asyncStart();
  s.reduce((a,b) => 0).then(
    (value) {
      Expect.fail("Returned future sould complete with error");
    },
    onError: (Object error) {
      asyncEnd();
    }
  );
}
