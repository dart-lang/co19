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
 * If onCancel is provided, it is called in a similar way to onListen when
 * the returned stream stops having listener. If it later gets a new listener,
 * the onListen function is called again.
 *
 * @description Checks that onCancel callback is called when broadcast stream
 * stops having listeners because they all cancel subscription.
 * @author ilya
 */
library asBroadcastStream_A04_t02;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  Stream s = create([1, 2, 3, 4, 5]);
  int cancelCount = 0;
  asyncStart();
  Stream b = s.asBroadcastStream(
      onCancel: (subs) {
        // cancel subscription to underlying stream
        subs.cancel();
        Expect.equals(3, cancelCount);
        asyncEnd();
      }
  );

  newSubscription(Stream stream, int count) {
    // get count elements and cancel
    StreamSubscription subs;
    subs = stream.listen(
       (_) {
         if (--count==0) {
           subs.cancel();
           cancelCount++;
         }
       }
    );
  }

  newSubscription(b, 1);
  newSubscription(b, 2);
  newSubscription(b, 3);
}
