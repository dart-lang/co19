/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int elapsedTicks
 * Returns the elapsed number of clock ticks since calling [start]
 * while the [Stopwatch] is running.
 * Returns the elapsed number of clock ticks between calling [start] and calling
 * [stop].
 * Returns 0 if the [Stopwatch] has never been started.
 * The elapsed number of clock ticks increases by [frequency] every second.
 * @description Checks that this method returns 0 if the stopwatch has never
 * been started.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

Duration delay = durationMs(10);
Stopwatch sw = new Stopwatch();
int count = 5;

main() {
  asyncStart();
  new Timer(delay, proc1);
}

void proc1() {
  int e1 = sw.elapsedTicks;
  Expect.equals(0, e1);
  if (count == 0) {
    asyncEnd();
    return;
  }
  count--;
  new Timer(delay, proc1);
}
