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
 * @description Checks that if this stream is single-subscription,
 * returned stream is indeed a broadcast stream.
 * @author kaigorodov
 */
library asBroadcastStream_A01_t02;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  Stream s1 = create([]);
  Stream s2 = s1.asBroadcastStream();
  Stream s3 = s2.asBroadcastStream();

  Expect.isTrue(s2.isBroadcast);
  Expect.isTrue(s3.isBroadcast);
}
