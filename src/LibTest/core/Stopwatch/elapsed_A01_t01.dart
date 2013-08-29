/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Duration elapsed
 * Returns the elapsedTicks counter converted to a Duration.
 * @description Checks that the elapsed tick count increases all the time once
 *              the stopwatch is started.
 * @author rodionov
 * @reviewer pagolubev
 */
import "../../../Utils/expect.dart";
 
main() {
  Stopwatch sw = new Stopwatch();
  sw.start();
  int e0 = sw.elapsed.inMicroseconds;
  int et = e0;
  for(int i = 0; i < 1000000; i++) {
    if(i % 100 == 0) {
      Expect.isTrue(sw.elapsed.inMicroseconds >= et);
      et = sw.elapsed.inMicroseconds;
    }
  }
  // assuming that a million iterations takes long enough
  Expect.isTrue(sw.elapsed.inMicroseconds > e0);
}
