/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Starts the [StopWatch]. The [elapsed] count is increasing
 *            monotonically. If the [StopWatch] has been stopped, then calling
 *            start again restarts it. If the [StopWatch] is currently running,
 *            then calling start does nothing.
 * @description Checks that calling this method on a stopwatch that wasn't
 *              previously running starts it, causing the elapsed count to increase.
 * @author rodionov
 * @reviewer pagolubev
 */
 
main() {
  StopWatch sw = new StopWatch();
  sw.start();
  int e0 = sw.elapsed();
  int et = e0;
  for(int i = 0; i < 1000000; i++) {
    if(i % 100 == 0) {
      Expect.isTrue(sw.elapsed() >= et);
      et = sw.elapsed();
    }
  }
  // assuming that a million iterations takes long enough
  Expect.isTrue(sw.elapsed() > e0);
}
