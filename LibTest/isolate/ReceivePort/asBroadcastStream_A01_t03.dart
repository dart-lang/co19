/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> asBroadcastStream ({void onListen(StreamSubscription<T>
 *   subscription), void onCancel(StreamSubscription<T> subscription)})
 * Returns a multi-subscription stream that produces the same events as this.
 * If this stream is single-subscription, return a new stream that allows multiple subscribers.
 * It will subscribe to this stream when its first subscriber is added,
 * and will stay subscribed until this stream ends, or a callback cancels the subscription.
 * @description Checks that if the only subscription to broadcast stream cancel,
 * broadcast stream unsubscribes from underlying stream.
 * @author ilya
 * @author a.semenov@unipro.ru
 */

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

var cancelResult;
List receivedData = [];
bool onDoneCalled = false;

void finish() {
  if (cancelResult==null) {
    Expect.listEquals([0], receivedData);
    Expect.isFalse(onDoneCalled);
  }
  asyncEnd();
}

main() {
  asyncStart();

  var s = IsolateStream.fromIterable([0,1,2,3], onDone: finish);
  var b = s.asBroadcastStream();

  StreamSubscription subs = b.listen(null);

  subs.onData((i) {
    receivedData.add(i);
    cancelResult = subs.cancel();
  });

  subs.onDone(() {
    onDoneCalled = true;
  });
}

