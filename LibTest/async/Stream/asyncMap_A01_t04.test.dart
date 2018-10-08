/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Stream asyncMap(dynamic convert(T event))
 * Creates a new stream with each data event of this stream asynchronously
 * mapped to a new event.
 *
 * This acts like map, except that convert may return a Future, and in that
 * case, the stream waits for that future to complete before continuing with
 * its result.
 *
 * @description Checks that if convert return a Future, the stream waits for
 * that future to complete before continuing with its result.
 * @author a.semenov@unipro.ru
 */
library asyncMap_A01_t04;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> stream, List<T> expected) {
  AsyncExpect.data(
      expected,
      stream.asyncMap((e) => new Future.delayed(durationMs(50), () => e))
  );
}

void test(CreateStreamFunction create) {
  check(create([]), []);
  check(create([1, 2, 3, 4]), [1, 2, 3, 4]);
  check(create([null, "2", -3, 4.0, []]), [null, "2", -3, 4.0, []]);
}
