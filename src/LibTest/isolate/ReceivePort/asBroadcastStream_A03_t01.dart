/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> asBroadcastStream ({void onListen(StreamSubscription<T>
 *   subscription), void onCancel(StreamSubscription<T> subscription)})
 * If onListen is provided, it is called with a subscription-like object that
 * represents the underlying subscription to this stream. It is possible to
 * pause, resume or cancel the subscription during the call to onListen. It
 * is not possible to change the event handlers, including using
 * StreamSubscription.asFuture.
 * @description Checks that onListen callback is called when broadcast stream
 * gets its subscribers and if subscription to underlying stream is cancelled
 * in this callback, no onData events will be fired.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

main() {
  var s = IsolateStream.fromIterable([0,1,2,3]);

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

