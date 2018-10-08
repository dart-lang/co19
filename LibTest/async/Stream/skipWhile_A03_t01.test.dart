/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> skip(int count)
 * The returned stream is a broadcast stream if this stream is.
 * @description Checks that the returned stream is a broadcast stream if this
 * stream is.
 * @author a.semenov@unipro.ru
 */
library skipWhile_A03_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, bool test(T element)) {
  Expect.equals(s.isBroadcast, s.skipWhile(test).isBroadcast);
}

void test(CreateStreamFunction create) {
  check(create([]), (x) => false);
  check(create([]).asBroadcastStream(), (x) => false);
  check(create([]), (x) => true);
  check(create([]).asBroadcastStream(), (x) => true);
  check(create([null]), (x) => true);
  check(create([null]).asBroadcastStream(), (x) => true);
  check(create([null]), (x) => false);
  check(create([null]).asBroadcastStream(), (x) => false);
  check(create([1, 2, 3]), (x) => false);
  check(create([1, 2, 3]).asBroadcastStream(), (x) => false);
  check(create([1, 2, 3]), (x) => x==1);
  check(create([1, 2, 3]).asBroadcastStream(), (x) => x==1);
  check(create([1, 2, 3]), (x) => true);
  check(create([1, 2, 3]).asBroadcastStream(), (x) => true);
}
