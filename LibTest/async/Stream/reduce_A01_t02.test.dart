/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> reduce(T combine(T previous, T element))
 * Reduces a sequence of values by repeatedly applying combine.
 * @description Checks that if the stream contains single element, the combine
 * method is not called and that element is the result of the future.
 * @note undocumented
 * @author kaigorodov
 */
library reduce_A01_t02;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream<T> s, T combine(T previous, T element), Object expected) {
  asyncStart();
  s.reduce(combine).then((actual) {
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([777]), (a,b) => Expect.fail("combine should not be called"), 777);
}
