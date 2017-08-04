/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> reduce(T combine(T previous, T element))
 * Reduces a sequence of values by repeatedly applying combine.
 * @description Checks that if stream contains error, then returned future is
 * completed with this error.
 * @author a.semenov@unipro.ru
 */
library reduce_A03_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream<T> s, T combine(T p, T e), Object expected) {
  asyncStart();
  s.reduce(combine).then(
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
  check(create([1, 2, 3, 4, 5], isError:(_) => true), (p, e) => p + e, 1);
  check(create([1, 2, 3, 4, 5], isError:(x) => x.isEven), (p, e) => p * e, 2);
  check(create([1, 2, 3, 4, 5], isError:(x) => x==5), (p, e) => p + e, 5);
}
