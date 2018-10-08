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
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, T timeoutValue) {
  Expect.equals(s.isBroadcast, s.timeout(durationMs(10)).isBroadcast);
  Expect.equals(s.isBroadcast,
                s.timeout(
                    durationMs(10),
                    onTimeout:(EventSink<T> sink) => sink.add(timeoutValue)
                ).isBroadcast
  );
}

void test(CreateStreamFunction create) {
  check(create([]), -1);
  check(create([]).asBroadcastStream(), -1);
  check(create([null]), null);
  check(create([null]).asBroadcastStream(), null);
  check(create([1, 2, 3]), -1);
  check(create([1, 2, 3]).asBroadcastStream(), -1);
}
