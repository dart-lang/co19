/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int elapsedMicroseconds #
 * Returns the [elapsed] counter converted to microseconds.
 * @description Checks that the proportion between values returned by elapsed()
 * and this method is correct and that this value is never negative. Checks
 * several successive different values returned by elapsedInUs().
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

Duration delay = durationMs(10);
Stopwatch sw = new Stopwatch();
int count = 5;

void check() {
  Expect.equals(sw.elapsed.inMicroseconds, sw.elapsedMicroseconds);
}

main() {
  check();
  sw.start();
  asyncStart();
  new Timer(delay, proc1);
}

void proc1() {
  sw.stop();
  check();
  if (count == 0) {
    asyncEnd();
    return;
  }
  count--;
  sw.start();
  new Timer(delay, proc1);
}
