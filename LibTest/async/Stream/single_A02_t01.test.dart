/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> single
 * Returns the single element.
 * If this is empty or has more than one element throws a StateError.
 * @description Checks that a error is thrown if this is empty or has more
 * than one element.
 * @author kaigorodov
 */
library single_A02_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s) {
  asyncStart();
  s.single.then(
    (value) {
      Expect.fail("Returned future sould complete with error");
    },
    onError: (error) {
      asyncEnd();
    }
  );
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([]));
  check(create([1, 2]));
  check(create(["a", "b", "c"]));
}
