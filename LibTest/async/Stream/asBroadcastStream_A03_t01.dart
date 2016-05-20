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
 * If this stream is already a broadcast stream, it is returned unmodified.
 *
 * If onListen is provided, it is called with a subscription-like object that
 * represents the underlying subscription to this stream. It is possible to
 * pause, resume or cancel the subscription during the call to onListen. It
 * is not possible to change the event handlers, including using
 * StreamSubscription.asFuture.
 *
 * @description Checks that onListen callback is called when broadcast stream
 * gets its subscribers and if subscription to underlying stream is cancelled
 * in this callback, no onData events will be fired.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var s = new Stream.periodic(new Duration(milliseconds:1), (i) => i);

  asyncStart();

  var b = s.asBroadcastStream(onListen: (subs) {
    subs.cancel();
    asyncEnd();
  });

  b.listen((_) {
    Expect.fail('unexpected onData event');
  });

  b.listen((_) {
    Expect.fail('unexpected onData event');
  });
}

