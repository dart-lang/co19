/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<S> fold<S>(S initialValue, S combine(S previous, T element))
 * Reduces a sequence of values by repeatedly applying combine.
 * @description Checks that the result is correct.
 * @author kaigorodov
 */
library fold_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T,S>(Stream<T> s, S initialValue, S combine(S previous, T element),
    S expected) {
  AsyncExpect.value(expected, s.fold(initialValue, combine));
}

void test(CreateStreamFunction create) {
  check(create([1, 2, 3, 4]), 0,
      (int previous, int element) => previous + element, 10);
  check(create([1, 2, 3, 4]), 1,
      (int previous, int element) => previous * element, 24);
}
