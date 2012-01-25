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
 * @description Checks that calling this method when the Stopwatch is already running
 * doesn't do anything.
 * @author rodionov
 * @reviewer pagolubev
 */
 
main() {
  Stopwatch sw = new Stopwatch();
  sw.start();
  sw.start();
  sw.start();
  sw.start();
  sw.start();
  sw.start();
  sw.start();
  int e0 = sw.elapsed();
  int et = e0;
  for(int i = 0; i < 1000000; i++) {
    if(i % 100 == 0) {
      sw.start();
      Expect.isTrue(sw.elapsed() >= et);
      et = sw.elapsed();
    }
  }
  // assuming that a million iterations takes long enough
  Expect.isTrue(sw.elapsed() > e0);
}
