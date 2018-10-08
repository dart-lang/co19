/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> take(int count)
 * Provides at most the first n values of this stream.
 * Forwards the first n data events of this stream, and all error events,
 * to the returned stream, and ends with a done event.
 * If this stream produces fewer than count values before it's done,
 * so will the returned stream.
 * @description Checks that at most n elements are returned.
 * @author kaigorodov
 */
library take_A01_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.data([], create([]).take(0));
  AsyncExpect.data([], create([]).take(1));
  AsyncExpect.data([], create([]).take(10));

  AsyncExpect.data([], create([null]).take(0));
  AsyncExpect.data([null], create([null]).take(1));
  AsyncExpect.data([null], create([null]).take(2));

  AsyncExpect.data([], create([1,2,3]).take(0));
  AsyncExpect.data([1], create([1,2,3]).take(1));
  AsyncExpect.data([1,2], create([1,2,3]).take(2));
  AsyncExpect.data([1,2,3], create([1,2,3]).take(12));

  AsyncExpect.data([[], [[]]], create([[], [[]], [[[]]]]).take(2));
}
