/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> asBroadcastStream({void onListen(StreamSubscription<T> subscription), void onCancel(StreamSubscription<T> subscription)})
 * Returns a multi-subscription stream that produces the same events as this.
 * If this stream is already a broadcast stream, it is returned unmodified.
 * It will subscribe to this stream when its first subscriber is added,
 * and will stay subscribed until this stream ends, or a callback cancels the subscription.
 * 
 * If onListen is provided, it is called with a subscription-like object that represents the underlying subscription to this stream. It is possible to pause, resume or cancel the subscription during the call to onListen. It is not possible to change the event handlers, including using StreamSubscription.asFuture.
 *
 * If onCancel is provided, it is called in a similar way to onListen when the returned stream stops having listener. If it later gets a new listener, the onListen function is called again.
 *
 * @description Checks that returned a multi-subscription stream produces the same events as this.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(List events0) {
  MessageBox mbox=new MessageBox();
  Stream s1=mbox.stream.asBroadcastStream();
  
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

  for (var element in events0) {
    mbox.sink.add(element);
  }
  mbox.sink.close();
}

main() {
  check([]);
  check([1,2,null,[]]);
}

