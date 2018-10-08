/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> distinct([bool equals(T previous, T next)])
 *    Skips data events if they are equal to the previous data event.
 *    The returned stream provides the same events as this stream, except that it
 * never provides two consecutive data events that are equal.
 * @description Checks that errors thrown by [equals] are added to the returned
 * stream.
 * @issue #29627
 * @author a.semenov@unipro.ru
 */
library distinct_A05_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.events([], [], create([]).distinct((p, n) => throw "error"));
  AsyncExpect.events([1], ["a","a"], create([1,2,3]).distinct((p, n) => throw "a"));
  AsyncExpect.events(
      [1,2,4], // data
      [3,5],  // errors
      create([1,2,3,4,5]).distinct((p, n) => n.isOdd ? throw n : p==n)
  );
}
