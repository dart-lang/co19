/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream.periodic(Duration period,
 *     [T computation(int computationCount)])
 * The argument to this callback is an integer that starts with 0 and is
 * incremented for every event.
 * @description Checks that the argument to this callback is an integer that
 * starts with 0 and is incremented for every event.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

const int maxCount = 5;

void check(int periodMs) {
  String id = "s$periodMs";
  Duration period = durationMs(periodMs);
  StreamSubscription<int> subs;
  int count = 0;
  asyncStart();
  Stream s = new Stream<int>.periodic(period, (computationCount) {
    Expect.equals(count, computationCount,
        "periodic($id): count=$count, computationCount=$computationCount");
    if (count > maxCount) {
      Expect.fail("Stream events should not be generated after cancellation");
    }
    count++;
    if (count == maxCount) {
      subs.cancel();
      asyncEnd();
    }
  });
  subs = s.listen((data) {}) as  StreamSubscription<int>;
}

main() {
  check(0);
  check(1);
  check(10);
  check(30);
  check(-10);
}
