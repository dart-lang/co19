/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> where(bool test(T event))
 * Creates a new stream from this stream that discards some data events.
 * The new stream sends the same error and done events as this stream, but it
 * only sends the data events that satisfy the test.
 * @description Checks that all stream events are checked by the test.
 * Checks that the stream sends only the data events that satisfy the test.
 * @author kaigorodov
 */
library where_A01_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.data([], create([]).where((e) => true));
  AsyncExpect.data([], create([]).where((e) => false));

  AsyncExpect.data([null], create([1, 2, 3, null]).where((int e) => e == null));
  AsyncExpect.data([3], create([1, 2, 3]).where((int e) => e > 2));
  AsyncExpect.data(
      [30],
      create(new Iterable.generate(10, (int i) => i * 5)).where((int e) => e == 30)
  );
  AsyncExpect.data([1,3,5], create([1, 2, 3, 4, 5]).where((int e) => e.isOdd));
  AsyncExpect.data([2,4], create([1, 2, 3, 4, 5]).where((int e) => e.isEven));
}
