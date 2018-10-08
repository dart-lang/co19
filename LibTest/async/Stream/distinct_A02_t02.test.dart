/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Stream<T> distinct([bool equals(T previous, T next)])
 * The returned stream is a broadcast stream if this stream is.
 *
 * @description Checks that the returned stream is a broadcast stream
 * if source stream is. [equals] is provided
 * @author a.semenov@unipro.ru
 */
library distinct_A02_t02;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> stream, bool equals(T previous, T next)) {
  Expect.equals(stream.isBroadcast, stream.distinct(equals).isBroadcast);
}

void test(CreateStreamFunction create) {

  check(create([]), (p,n) => true);
  check(create([]).asBroadcastStream(), (p,n) => true);
  check(create([]), (p,n) => false);
  check(create([]).asBroadcastStream(), (p,n) => false);

  check(create([1,2,3,4,5]), (p,n) => true);
  check(create([1,2,3,4,5]).asBroadcastStream(), (p,n) => true);
  check(create([1,2,3,4,5]), (p,n) => false);
  check(create([1,2,3,4,5]).asBroadcastStream(), (p,n) => false);
  check(create([1,2,3,4,5]), (p,n) => p==n);
  check(create([1,2,3,4,5]).asBroadcastStream(), (p,n) => p==n);
}
