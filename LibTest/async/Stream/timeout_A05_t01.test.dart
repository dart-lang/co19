/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream timeout(Duration timeLimit,
 *                           {void onTimeout(EventSink sink)})
 * The returned stream is a broadcast stream if this stream is.
 * @description Checks that the returned stream is a broadcast stream if this
 * stream is.
 * @author a.semenov@unipro.ru
 */
library timeout_A05_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream<T> s) {
  Expect.equals(s.isBroadcast, s.timeout(durationMs(10)).isBroadcast);
  Expect.equals(s.isBroadcast,
                s.timeout(
                    durationMs(10),
                    onTimeout:(sink) => sink.add(-1)
                ).isBroadcast
  );
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([]));
  check(create([]).asBroadcastStream());
  check(create([null]));
  check(create([null]).asBroadcastStream());
  check(create([1, 2, 3]));
  check(create([1, 2, 3]).asBroadcastStream());
}
