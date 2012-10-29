/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the elapsed number of clock ticks since calling [start]
 *            while the [Stopwatch] is running. Returns the elapsed number of
 *            clock ticks between calling [start] and calling [stop]. Returns 0
 *            if the [Stopwatch] has never been started. The elapsed number of
 *            clock ticks increases by [frequency] every second.
 * @description Checks that the elapsed tick count increases all the time once
 *              the stopwatch is started.
 * @author rodionov
 * @reviewer pagolubev
 */
 
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
