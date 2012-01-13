/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the frequency of clock ticks in Hz.
 * @description Checks that the value returned by this method is constant and
 *              positive.
 * @author rodionov
 * @reviewer msyabro
 */
 
main() {
  int f = Clock.frequency();
  Expect.isTrue(f > 0, "Clock frequency is not positive: $f");
  for(int i = 0; i < 1000000; i++) {
    if(i % 1000 == 0) {
      Expect.equals(f, Clock.frequency());
    }
  }
  Expect.equals(f, Clock.frequency());
}
