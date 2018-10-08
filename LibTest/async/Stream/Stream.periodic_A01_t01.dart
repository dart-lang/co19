/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream.periodic(Duration period,
 *     [T computation(int computationCount)])
 * Creates a stream that repeatedly emits events at period intervals.
 * If computation is omitted the event values will all be null.
 * @description Checks that created stream emits events at period intervals.
 * Checks that if computation is omitted the event value is null.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

void check(int periodMs) {
  Duration period = durationMs(periodMs);
  const int maxCount = 5;
  int count = 0;

  Stopwatch sw = new Stopwatch();
  sw.start();

  asyncStart();

  Stream s = new Stream.periodic(period);
  StreamSubscription ss;
  ss = s.listen(
    (var event) {
      count++;
      Expect.isNull(event);
      Duration expected = period*count;
      Duration actual = sw.elapsed;
      Expect.isTrue(expected <= actual, "expected=$expected, actual=$actual");
      //print('expected=$expected actual=$actual');
      if (count >= maxCount) {
        ss.cancel();
        asyncEnd();
      }
    }
  );
}

main() {
  check(0);
  check(1);
  check(10);
  check(30);
  check(100);
}
