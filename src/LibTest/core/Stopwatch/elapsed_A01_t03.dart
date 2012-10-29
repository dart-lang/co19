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
 * @description Checks that this method returns 0 if the stopwatch has never been started.
 * @author rodionov
 * @reviewer pagolubev
 */
 
main() {
  Stopwatch sw = new Stopwatch();
  for(int i = 0; i < 1000000; i++) {
    if(i % 100 == 0) {
      Expect.equals(0, sw.elapsedTicks);
    }
  }
}
