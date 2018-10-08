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
 * If onListen is provided, it is called with a subscription-like object that
 * represents the underlying subscription to this stream. It is possible to
 * pause, resume or cancel the subscription during the call to onListen. It
 * is not possible to change the event handlers, including using
 * StreamSubscription.asFuture.
 *
 * @description Checks that it is a runtime error to try to change event
 * handlers for underlying subscription.
 * @author ilya
 * @author a.semenov@unipro.ru
 */
library asBroadcastStream_A03_t02;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  Stream<int> s = create([1,2,3]);
  s.asBroadcastStream(onListen: (StreamSubscription ss) {
    Expect.throws(()=>ss.onData((_){}));
  }).listen((_){});
}
