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
 * if source stream is. [equals] is omitted
 * @author a.semenov@unipro.ru
 */
library distinct_A02_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> stream) {
  Expect.equals(stream.isBroadcast, stream.distinct().isBroadcast);
}

void test(CreateStreamFunction create) {

  check(create([]));
  check(create([]).asBroadcastStream());

  check(create([1,2,3,4,5]));
  check(create([1,2,3,4,5]).asBroadcastStream());

  check(create(["a","b","c"]));
  check(create(["a","b","c"]).asBroadcastStream());
}
