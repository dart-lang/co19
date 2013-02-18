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
 * @description Checks that calling this method on a stopwatch that wasn't
 *              previously running starts it, causing the elapsed count to increase.
 * @author rodionov
 * @reviewer pagolubev
 */
import "../../../Utils/expect.dart";
 
main() {
  Stopwatch sw = new Stopwatch();
  sw.start();
  int e0 = sw.elapsedTicks;
  int et = e0;
  for(int i = 0; i < 1000000; i++) {
    if(i % 100 == 0) {
      Expect.isTrue(sw.elapsedTicks >= et);
      et = sw.elapsedTicks;
    }
  }
  // assuming that a million iterations takes long enough
  Expect.isTrue(sw.elapsedTicks > e0);
}
