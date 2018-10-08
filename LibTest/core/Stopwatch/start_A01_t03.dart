/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void start()
 * Starts the [Stopwatch].
 * The [elapsed] count is increasing monotonically.
 * If the [Stopwatch] has been stopped, then calling start again restarts it
 * without resetting the elapsed count.
 * If the [Stopwatch] is currently running, then calling start does nothing.
 * @description Checks that calling this method when the Stopwatch is already
 * running doesn't do anything.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/expect.dart";

Duration delay = durationMs(50);
Stopwatch sw = new Stopwatch();
int e0;

main() {
  sw.start();
  sw.start();
  sw.start();
  sw.start();
  sw.start();
  sw.start();
  sw.start();
  e0 = sw.elapsedTicks;
  asyncStart();
  new Timer(delay, proc1);
}

void proc1() {
  int e1 = sw.elapsedTicks;
  Expect.isTrue(e1 > e0);
  asyncEnd();
}
