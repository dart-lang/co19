/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the frequency of the elapsed counter in Hz.
 * @description Checks that the value returned by this method is positive and
 *              constant.
 * @author rodionov
 * @reviewer pagolubev
 * @needsreview
 */
 
main() {
  Stopwatch sw = new Stopwatch();
  int f = sw.frequency();
  Expect.isTrue(f > 0, "stopwatch frequency is not positive: $f");
  sw.start();
  for(int i = 0; i < 1000000; i++) {
    if(i % 1000 == 0) {
      Expect.equals(f, sw.frequency());
    }
  }
  sw.stop();
  Expect.equals(f, sw.frequency());

  sw.start();
  for(int i = 0; i < 1000000; i++) {
    if(i % 1000 == 0) {
      Expect.equals(f, sw.frequency());
    }
  }
  sw.stop();
  Expect.equals(f, sw.frequency());
}
