/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Starts the [Stopwatch]. The [elapsed] count is increasing
 *            monotonically. If the [Stopwatch] has been stopped, then calling
 *            start again restarts it. If the [Stopwatch] is currently running,
 *            then calling start does nothing.
 * @description Checks that calling this method on a stopwatch that was stopped
 *              causes it to resume count.
 * @author rodionov
 * @reviewer pagolubev
 * @needsreview issue 477
 */

main() {
  Stopwatch sw = new Stopwatch();
  print("Freq: ${sw.frequency}Hz");
  sw.start();
  // run the counter up
  for(int i = 0; i < 1000000; i++) {
    if(i % 100 == 0) {
      // gotta verify the assumption
      Expect.isTrue(sw.elapsedTicks >= 0);
    }
  }
  int e1 = sw.elapsedTicks;
  print("Elapsed: ${sw.elapsedTicks}");
  sw.stop();
  print("Elapsed: ${sw.elapsedTicks}");
  e1 = sw.elapsedTicks;
  sw.start();
  print("Elapsed: ${sw.elapsedTicks}");
  // gotta verify the assumption
  Expect.isTrue(sw.elapsedTicks >= e1);

  int e0 = sw.elapsedTicks;
  int et = e0;
  for(int i = 0; i < 1000000; i++) {
    if(i % 100 == 0) {
      Expect.isTrue(sw.elapsedTicks >= et);
      et = sw.elapsedTicks;
    }
  }
  // assuming that a million iterations takes long enough
  print("Elapsed: ${sw.elapsedTicks}");
  Expect.isTrue(sw.elapsedTicks > e0);
}
