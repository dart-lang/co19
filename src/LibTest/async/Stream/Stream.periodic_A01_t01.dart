/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Stream.periodic(Duration period, [T computation(int computationCount)])
 * Creates a stream that repeatedly emits events at period intervals.
 * If computation is omitted the event values will all be null.
 * @description Checks that created stream emits events at period intervals.
 * Checks that if computation is omitted the event value is null.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

typedef int Computation(int computationCount);

class MyListener extends StreamListener<int> {
  static const maxCount = 5;
  
  Duration period;
  DateTime prev=new DateTime.now();
  int count=0;
  
  MyListener(this.period);
  
  void onData(int event) {
    Expect.isNull(event, "onData");
    DateTime now=new DateTime.now();
    Duration delta=now.difference(prev);
    Expect.approxEquals(period.inMilliseconds, delta.inMilliseconds, 20);
    prev=now;
    count++;
    if (count>=maxCount) {
      subscription.cancel();
    }
  }
  
  void onError(error)  {
    throw new Error("onError called unexpectedly");
  }
  
  void onDone(){
    asyncEnd();
  }
  
}

check(int periodMs) {
  Duration period=durationMs(periodMs);
  Stream s=new Stream.periodic(period);
  MyListener l=new MyListener(period);
  asyncStart();
  StreamSubscription<int> subs=l.listenTo(s);
}

main() {
  check(0);
  check(1);
  check(10);
  check(30);
  check(100);
}
