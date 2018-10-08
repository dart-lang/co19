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
 * @description Checks that subscription to underlying stream can be paused in
 * onCancel callback when broadcast stream stops having listeners and resumed
 * again in onListen callback when new listeners appear.
 * @author ilya
 */
library asBroadcastStream_A04_t03;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  Iterable<int> iterable = new Iterable<int>.generate(100, (int x) => x);
  List<int> values = iterable.toList();
  Stream<int> s = create(iterable);

  bool anySubscribers = false;
  bool firstListen = true;
  bool streamOpen = true;
  Timer timer;

  asyncStart();

  Stream<int> b = s.asBroadcastStream(
      onListen: (StreamSubscription<int> subs) {
        if (firstListen)
          firstListen = false;
        else {
          Expect.isTrue(subs.isPaused);
          subs.resume();
        }
      },
      onCancel: (StreamSubscription<int> subs) {
        if (streamOpen) {
          Expect.isFalse(subs.isPaused);
          subs.pause();
          anySubscribers = false;
        } else {
          subs.cancel();
          timer.cancel();
          Expect.listEquals([], values);
          asyncEnd();
        }
      }
  );

  newSubscription(Stream<int> stream, int n) {
    // get n elements and cancel
    int count = 0;
    StreamSubscription subs = stream.listen(null);
    subs.onData((x) {
      // remove seen value from list
      values.remove(x);
      if (++count == n)
        subs.cancel();
    });
    subs.onDone(() {
      streamOpen = false;
    });
  }

  addSubscribersIfNeeded(_) {
    if (streamOpen && !anySubscribers) {
      newSubscription(b, 1);
      newSubscription(b, 2);
      newSubscription(b, 3);
      anySubscribers = true;
    }
  }

  timer = new Timer.periodic(durationMs(10), addSubscribersIfNeeded);
}
