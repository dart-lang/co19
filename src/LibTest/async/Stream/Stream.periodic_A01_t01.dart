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

Stopwatch sw=new Stopwatch();
const maxCount = 5;

class MyListener extends StreamListener<int> {
  
  Duration period;
  int count=0;
  
  MyListener(this.period);
  
  void onData(int event) {
    count++;
    Expect.isNull(event, "onData");
    Duration expected=period*count;
    Duration actual=sw.elapsed;
    Expect.isTrue(expected<=actual, "expected=$expected, actual=$actual");
    if (count>=maxCount) {
      subscription.cancel();
    }
  }
  
  void onError(error)  {
    throw error;
  }
  
  void onDone(){
    asyncEnd();
  }
  
}

check(int periodMs) {
  Duration period=durationMs(periodMs);
  sw.start();
  
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
