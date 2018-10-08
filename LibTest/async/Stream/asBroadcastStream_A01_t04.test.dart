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
 * @description Checks that if some subscriptions to broadcast stream cancel,
 * other still listen to completion.
 * @author ilya
 */
library asBroadcastStream_A01_t04;
import "dart:async";
import "../../../Utils/expect.dart";

const int subscribersCount = 10;
const int dataSize = 1000;

void multiListen(Stream<int> s) {

  for(int i = 0; i < subscribersCount; ++i) {
    asyncStart();
    if (i.isEven) {
      // listener that quits after half of data
      StreamSubscription quitter;
      quitter = s.listen(
        (int data) {
          if (data > dataSize / 2) {
            quitter.cancel();
            asyncEnd();
          }
        }
      );
    } else {
      // listener that works to completion
      int processed = 0;
      s.listen(
        (int data) {++processed;},
        onDone: () {
          Expect.equals(dataSize, processed);
          asyncEnd();
        }
      );
    }
  }
}

void test(CreateStreamFunction create) {
  multiListen(
      create(new Iterable<int>.generate(dataSize, (i) => i)).asBroadcastStream()
  );
}
