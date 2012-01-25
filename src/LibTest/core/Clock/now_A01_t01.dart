/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the current clock tick.
 * @description Checks that the value returned by this method is always positive
 *              and increases all the time.
 * @author rodionov
 * @reviewer msyabro
 */
 
main() {
  int t0 = Clock.now();
  int t = t0;
  Expect.isTrue(t > 0);
  for(int i = 0; i < 1000000; i++) {
    if(i % 1000 == 0) {
      Expect.isTrue(Clock.now() >= t);
      t = Clock.now();
    }
  }
}
