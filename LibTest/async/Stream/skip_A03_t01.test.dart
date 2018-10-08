/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> skip(int count)
 *    Skips the first count data events from this stream.
 *    Returns a stream that emits the same events as this stream would
 * if listened to at the same time, except that the first [count]
 * data events are not emitted.
 * The returned stream is done when this stream is.
 *    If this stream emits fewer than [count] data events
 * before being done, the returned stream emits no data events.
 * @description Checks that errors in the input stream are propagated to the
 * returned stream.
 * @author a.semenov@unipro.ru
 */
library skip_A03_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamWithErrorsFunction create) {
  AsyncExpect.events([], [1,2,3], create([1, 2, 3], isError: (_) => true).skip(0));
  AsyncExpect.events([], [1,2,3], create([1, 2, 3], isError: (_) => true).skip(1));
  AsyncExpect.events([], [1,2,3], create([1, 2, 3], isError: (_) => true).skip(10));

  AsyncExpect.events([], [1,3,5], create([1, 2, 3, 4, 5], isError: (x) => x.isOdd).skip(10));
  AsyncExpect.events([3,5], [2,4], create([1, 2, 3, 4, 5], isError: (x) => x.isEven).skip(1));
  AsyncExpect.events([5], [2,4], create([1, 2, 3, 4, 5], isError: (x) => x.isEven).skip(2));
}
