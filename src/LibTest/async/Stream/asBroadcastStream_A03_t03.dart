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
 * @description Checks that it is a runtime error to try to change event
 * handlers for underlying subscription using StreamSubscription.asFuture.
 * @runtime-error
 * @author ilya
 */

import "dart:async";

main() {
  var s = new Stream.fromIterable([1]);

  s.asBroadcastStream(onListen: (subs) {
    subs.asFuture().then((_){});
  }).listen((_) {});
}

