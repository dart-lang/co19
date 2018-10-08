/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the frequency of the elapsed counter in Hz.
 * @description Checks that the value returned by this method is positive and
 *              constant.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";
 
main() {
  Stopwatch sw = new Stopwatch();
  int f = sw.frequency;
  
  void check() {
    for(int i = 0; i < 100; i++) {
      Expect.equals(f, sw.frequency);
    }
  }
  
  Expect.isTrue(f > 0, "Stopwatch frequency is not positive: $f");
  
  for (int k = 0; k < 10; k++) {
    check();
    sw.start();
    check();
    sw.stop();
  }
}
