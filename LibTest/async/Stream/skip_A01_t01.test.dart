/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> skip(int count)
 * Skips the first count data events from this stream.
 * @description Checks that the first n elements are skipped.
 * @author kaigorodov
 */
library skip_A01_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.data([], create([]).skip(0));
  AsyncExpect.data([], create([]).skip(1));
  AsyncExpect.data([], create([]).skip(10));
  AsyncExpect.data([null], create([null]).skip(0));
  AsyncExpect.data([], create([null]).skip(1));
  AsyncExpect.data([], create([null]).skip(2));
  AsyncExpect.data([1, 2, 3], create([1, 2, 3]).skip(0));
  AsyncExpect.data([2, 3], create([1, 2, 3]).skip(1));
  AsyncExpect.data([3], create([1, 2, 3]).skip(2));
  AsyncExpect.data([], create([1, 2, 3]).skip(12));
  AsyncExpect.data([[[[]]]], create([[], [[]], [[[]]]]).skip(2));
}
