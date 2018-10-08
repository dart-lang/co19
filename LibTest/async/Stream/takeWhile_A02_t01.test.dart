/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> takeWhile(bool test(T element))
 * The returned stream is a broadcast stream if this stream is.
 * @description Checks that the returned stream is a broadcast stream if this
 * stream is.
 * @author a.semenov@unipro.ru
 */
library takeWhile_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s) {
  Expect.equals(s.isBroadcast, s.takeWhile((e) => true).isBroadcast);
}

void test(CreateStreamFunction create) {
  check(create([]));
  check(create([]).asBroadcastStream());
  check(create([null]));
  check(create([null]).asBroadcastStream());
  check(create([1, 2, 3]));
  check(create([1, 2, 3]).asBroadcastStream());
}
