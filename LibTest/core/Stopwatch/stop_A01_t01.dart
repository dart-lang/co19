/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void stop()
 * Stops the [Stopwatch].
 * The [elapsedTicks] count stops increasing.
 * If the [Stopwatch] is currently not running, then calling this method has no
 * effect.
 * @description Checks that this method indeed stops the stopwatch.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

Duration delay = durationMs(10);
Stopwatch sw = new Stopwatch();
int count = 5;
int ticks = -1;

main() {
  sw.start();
  asyncStart();
  new Timer(delay, proc1);
}

void proc1() {
  sw.stop();
  ticks = sw.elapsedTicks;
  new Timer(delay, proc2);
}

void proc2() {
  int e1 = sw.elapsedTicks;
  Expect.equals(ticks, e1);
  if (count == 0) {
    asyncEnd();
    return;
  }
  count--;
  sw.start();
  new Timer(delay, proc1);
}
