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
 *              restarts it, causing the elapsed count to reset and then start increasing again.
 * @author rodionov
 * @reviewer pagolubev
 * @needsreview
 */

main() {
  Stopwatch sw = new Stopwatch();
  print("Freq: " + sw.frequency() + "Hz");
  sw.start();
  // run the counter up
  for(int i = 0; i < 1000000; i++) {
    if(i % 100 == 0) {
      // gotta verify the assumption
      Expect.isTrue(sw.elapsed() >= 0);
    }
  }
  int e1 = sw.elapsed();
  print("Elapsed: " + sw.elapsed());
  sw.stop();
  print("Elapsed: " + sw.elapsed());
  sw.start();
  print("Elapsed: " + sw.elapsed());
  // gotta verify the assumption
  Expect.isTrue(sw.elapsed() >= 0);
  // restart implies counter reset, right?
  Expect.isTrue(sw.elapsed() < e1);
  int e0 = sw.elapsed();
  int et = e0;
  for(int i = 0; i < 1000000; i++) {
    if(i % 100 == 0) {
      Expect.isTrue(sw.elapsed() >= et);
      et = sw.elapsed();
    }
  }
  // assuming that a million iterations takes long enough
  print("Elapsed: " + sw.elapsed());
  Expect.isTrue(sw.elapsed() > e0);
}
