/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> skipWhile(bool test(T element))
 * Skip data events from this stream while they are matched by test.
 * Error and done events are provided by the returned stream unmodified.
 * Starting with the first data event where test returns false for the event
 * data, the returned stream will have the same events as this stream.
 * @description Checks that elements matched by a test are skipped.
 * @author kaigorodov
 */
library skipWhile_A01_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.data([], create([]).skipWhile(null));
  AsyncExpect.data([1, 2 ,3], create([1, 2, 3]).skipWhile((element) => false));
  AsyncExpect.data([1, 2 ,3], create([-1, -2, -3, 1, 2, 3]).skipWhile((e) => e < 0));
  AsyncExpect.data([2 ,3], create([1, 2, 3]).skipWhile((e) => e == 1));
  AsyncExpect.data([], create([1, 2, 3]).skipWhile((element) => true));
}
