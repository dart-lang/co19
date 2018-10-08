/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> asBroadcastStream ({void onListen(StreamSubscription<T>
 *   subscription), void onCancel(StreamSubscription<T> subscription)})
 * If onCancel is provided, it is called in a similar way to onListen when
 * the returned stream stops having listener. If it later gets a new listener,
 * the onListen function is called again.
 * @description Checks that onCancel callback is called when broadcast stream
 * stops having listeners because they all cancel subscription.
 * @author ilya
 */

import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

main() {
  var s = IsolateStream.fromIterable([1,2,3]);

  asyncStart();
  var b = s.asBroadcastStream(onCancel: (subs) {
    // cancel subscription to underlying stream
    subs.cancel();
    asyncEnd();
  });

  newSubscription(stream) {
    // get one element and cancel
    var subs = stream.listen(null);
    subs.onData((_) {subs.cancel();});
  }

  newSubscription(b);
  newSubscription(b);
  newSubscription(b);
}

