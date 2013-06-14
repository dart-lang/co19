/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> asBroadcastStream()
 * Returns a multi-subscription stream that produces the same events as this.
 * If this stream is single-subscription, return a new stream that allows multiple subscribers.
 * It will subscribe to this stream when its first subscriber is added,
 * and unsubscribe again when the last subscription is canceled.
 * @description Checks that returned a multi-subscription stream produces the same events as this.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(List events0) {
  Stream s1=new Stream.fromIterable(events0);
  Stream s2=s1.asBroadcastStream();
  List events1=new List();
  StreamSubscription ss=s2.listen((event){events1.add(event);});
  asyncStart();
  ss.onDone((){
    Expect.listEquals(events0, events1);
    asyncEnd();
  });
}

main() {
  check([]);
  check([1,2,null,[]]);
}

