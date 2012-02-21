/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the [elapsed] counter converted to milliseconds.
 * @description Checks that the proportion between values returned by elapsed()
 *              and this method is correct and that this value is never
 *              negative. Checks several successive different values returned by elapsedInMs().
 * @note stops the StopWatch before measuring the proportion and resumes afterwards
 * @author rodionov
 * @reviewer pagolubev
 */
 
main() {
  final int LOTS_OF_REPS  = 100000000; // long enough for the ms count to become positive
  int countdown = 10;
  
  Stopwatch sw = new Stopwatch();
  Expect.equals(0, sw.elapsedInMs());
  sw.start();
  int i, ms, lastMs = 0;
  for(i = 0; i < LOTS_OF_REPS && countdown > 0; i++) {
    if(i % 100 == 0) {
      ms = sw.elapsedInMs();
      Expect.isFalse(ms < 0, "The result of elapsedInMs()  was negative: $ms");

      if(ms > lastMs) {
        sw.stop();
        print("elapsed ticks: ${sw.elapsed()}, in ms: ${sw.elapsedInMs()}");
        Expect.equals(sw.elapsedInMs(), (sw.elapsed() * 1000) ~/ sw.frequency());
        countdown--;
        lastMs = ms;
        sw.start();
      }
    }
  }
  sw.stop();
  Expect.isTrue(i < LOTS_OF_REPS, "millisecond count of a started StopWatch didn't increase soon enough, last value: $ms");
}
