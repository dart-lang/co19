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
 * @description Checks that returned stream is indeed a multi-subscription
 * stream and it produces the same events as this.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

check(List events0) {
  Stream s0=IsolateStream.fromIterable(events0);
  Stream s1=s0.asBroadcastStream();
  
  List events1=new List();
  StreamSubscription ss1=s1.listen((event){events1.add(event);});
  asyncStart();
  ss1.onDone((){
    Expect.listEquals(events0, events1);
    asyncEnd();
  });
  
  List events2=new List();
  StreamSubscription ss2=s1.listen((event){events2.add(event);});
  asyncStart();
  ss2.onDone((){
    Expect.listEquals(events0, events2);
    asyncEnd();
  });
}

main() {
  check([]);
  check([1,2,null,[]]);
}

