/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the [elapsed] counter converted to microseconds.
 * @description Checks that the proportion between values returned by elapsed()
 *              and this method is correct and that this value is never
 *              negative. Checks several successive different values returned by elapsedInUs().
 * @note stops the StopWatch before measuring the proportion and resumes afterwards
 * @author rodionov
 * @reviewer pagolubev
 */
 
main() {
  final int LOTS_OF_REPS  = 1000000000; // long enough for the us count to become positive
  int countdown = 10;
  
  Stopwatch sw = new Stopwatch();
  Expect.equals(0, sw.elapsedInUs());
  sw.start();
  int i, us, lastUs = 0;
  for(i = 0; i < LOTS_OF_REPS && countdown > 0; i++) {
    if(i % 100 == 0) {
      us = sw.elapsedInUs();
      Expect.isFalse(us < 0, "The result of elapsedInUs()  was negative: $us");

      if(us > lastUs) {
        sw.stop();
        print("elapsed ticks: ${sw.elapsed()}, in us: ${sw.elapsedInUs()}");
        Expect.equals(sw.elapsedInUs(), (sw.elapsed() * 1000000) ~/ sw.frequency());
        countdown--;
        lastUs = us;
        sw.start();
      }
    }
  }
  sw.stop();
  Expect.isTrue(i < LOTS_OF_REPS, "microsecond count of a started StopWatch didn't increase soon enough, last value: $us");
}
