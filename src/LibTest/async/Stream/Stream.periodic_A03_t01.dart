/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Stream.periodic(Duration period, [T computation(int computationCount)])
 * The argument to this callback is an integer that starts with 0 and is incremented for every event.
 * @description Checks that the argument to this callback is an integer that starts with 0
 * and is incremented for every event.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

const maxCount=5;

check(int periodMs) {
  String id="s$periodMs"; 
  Duration period=durationMs(periodMs);
  StreamSubscription<int> subs;
  int count=0;
  asyncStart();
  Stream s=new Stream.periodic(period, (computationCount) {
    Expect.equals(count, computationCount, "periodic($id): count=$count, computationCount=$computationCount");
    if (count>maxCount) {
      Expect.fail("stream works after cancellation");
    }
    count++;
    if (count==maxCount) {
      subs.cancel();
      asyncEnd();
    }
  });
  subs=s.listen((data){});
  num p=periodMs>0?(periodMs*maxCount*1.1)+10:10;
  asyncStart();
  new Future.delayed(durationMs(p), () {
    Expect.equals(maxCount, count, "$id: check: count=$count");
    asyncEnd();
  });
}

main() {
  check(0);
  check(1);
  check(10);
  check(30);
  check(-10);
}
