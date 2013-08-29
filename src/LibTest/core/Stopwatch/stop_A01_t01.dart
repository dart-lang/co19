/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void stop()
 * Stops the [Stopwatch].
 * The [elapsedTicks] count stops increasing.
 * If the [Stopwatch] is currently not running, then calling this method has no effect.
 * @description Checks that this method indeed stops the stopwatch.
 * @author rodionov
 * @reviewer pagolubev
 */
import "../../../Utils/expect.dart";
 
main() {
  Stopwatch sw = new Stopwatch();
  sw.start();
  for(int i = 0; i < 1000000; i++) {
    // just ramp up the counts
    if(sw.elapsedMilliseconds > 0) break;
  }
  sw.stop();
  int e0 = sw.elapsedTicks;
  int ms0 = sw.elapsedMilliseconds;
  int us0 = sw.elapsedMicroseconds;
  for(int i = 0; i < 1000000; i++) {
    if(i % 1000 == 0) {
      Expect.equals(e0, sw.elapsedTicks, "elapsed() value changed after stop()");
      Expect.equals(ms0, sw.elapsedMilliseconds, "elapsedInMs() value changed after stop()");
      Expect.equals(us0, sw.elapsedMicroseconds, "elapsedInUs() value changed after stop()");
    }
  }
}
