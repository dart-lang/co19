/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> asBroadcastStream (
 *   {void onListen(StreamSubscription<T> subscription),
 *    void onCancel(StreamSubscription<T> subscription)})
 * Returns a multi-subscription stream that produces the same events as this.
 *
 * The returned stream will subscribe to this stream when its first subscriber
 * is added, and will stay subscribed until this stream ends, or a callback
 * cancels the subscription.
 *
 * @description Checks that returned stream is indeed a multi-subscription
 * stream and it produces the same events as this.
 * @author kaigorodov
 */
library asBroadcastStream_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s0, List<T> data) {
  Stream<T> s1 = s0.asBroadcastStream();
  AsyncExpect.data(data, s1);
  AsyncExpect.data(data, s1);
}

void test(CreateStreamFunction create) {
  check(create([]), []);
  check(create([1, 2, null, []]), [1, 2, null, []]);
}
