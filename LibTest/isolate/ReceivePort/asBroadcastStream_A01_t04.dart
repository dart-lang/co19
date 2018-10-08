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
 * @description Checks that if some subscriptions to broadcast stream cancel,
 * other still listen to completion.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

const subscribersCount = 10;
const dataSize = 12;

multiListen(Stream s) {

  for(int i=0; i<subscribersCount; ++i) {
    asyncStart();
    if (i.isEven) {
      // listener that quits after half of data
      var listening=true;
      var quitter = s.listen(null);
      quitter.onData((data) {
        if (listening) {
          if (data > dataSize/2) {
            quitter.cancel();
            listening=false;
            asyncEnd();
          }
        } else {
          Expect.fail('onData event after cancel');
        }
      });
    } else {
      // listener that works to completion
      int processed=0;
      s.listen((data){++processed;}, onDone: () {
        Expect.equals(dataSize, processed);
        asyncEnd();
      });
    }
  }
}

main() {
  multiListen(IsolateStream.fromIterable(new Iterable.generate(dataSize, (i) => i))
      .asBroadcastStream());
}

