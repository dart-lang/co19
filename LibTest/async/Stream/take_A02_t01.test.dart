/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> take(int count)
 * If this is a broadcast stream, the returned stream is a broadcast stream.
 * @description Checks that the returned stream is a broadcast stream if this
 * stream is.
 * @author a.semenov@unipro.ru
 */
library take_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, int count) {
  Expect.equals(s.isBroadcast, s.take(count).isBroadcast);
}

void test(CreateStreamFunction create) {
  check(create([]), 0);
  check(create([]).asBroadcastStream(), 0);
  check(create([]), 1);
  check(create([]).asBroadcastStream(), 1);
  check(create([null]), 0);
  check(create([null]).asBroadcastStream(), 0);
  check(create([null]), 1);
  check(create([null]).asBroadcastStream(), 1);
  check(create([1, 2, 3]), 0);
  check(create([1, 2, 3]).asBroadcastStream(), 0);
  check(create([1, 2, 3]), 1);
  check(create([1, 2, 3]).asBroadcastStream(), 1);
  check(create([1, 2, 3]), 12);
  check(create([1, 2, 3]).asBroadcastStream(), 12);
}
