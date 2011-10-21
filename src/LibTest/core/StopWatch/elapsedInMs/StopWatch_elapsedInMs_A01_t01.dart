/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the [elapsed] counter converted to milliseconds.
 * @description Checks that the proportion between values returned by elapsed()
 *              and this method is correct and that this value is never
 *              negative.
 * @author rodionov
 * @reviewer pagolubev
 */
 
main() {
  StopWatch sw = new StopWatch();
  Expect.equals(0, sw.elapsedInMs());
  sw.start();
  for(int i = 0; i < 1000000; i++) {
    if(i % 1000 == 0) {
      int ms = sw.elapsedInMs();
      Expect.isTrue(ms >= 0, "The result of elapsedInMs() ($ms) is negative");
    }
  }
  sw.stop();
  print("elapsed ticks: " + sw.elapsed() + ", in ms: " + sw.elapsedInMs());
  Expect.equals(sw.elapsedInMs(), (sw.elapsed() * 1000) ~/ sw.frequency());

  sw.start();
  for(int i = 0; i < 1000000; i++) {
    if(i % 1000 == 0) {
      int ms = sw.elapsedInMs();
      Expect.isTrue(ms >= 0, "The result of elapsedInMs() ($ms) is negative");
    }
  }
  sw.stop();
  print("elapsed ticks: " + sw.elapsed() + ", in ms: " + sw.elapsedInMs());
  Expect.equals(sw.elapsedInMs(), (sw.elapsed() * 1000) ~/ sw.frequency());
}
