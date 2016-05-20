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
 * @description Checks that if the only subscription to broadcast stream cancel,
 * broadcast stream unsubscribes from underlying stream.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

f(i) {
  if (i > 0) {
    Expect.fail('Subscription is still alive');
  }
}

main() {
  var s = new Stream.fromIterable(new Iterable.generate(5, (i) => f(i)));
  var b = s.asBroadcastStream();

  asyncStart();

  var subs = b.listen(null);

  subs.onData((_) {
    subs.cancel();
    asyncEnd();
  });
  subs.onDone(() {
    Expect.fail('onDone event after cancel');
  });
}

