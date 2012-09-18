/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a random double greater than or equal to 0.0 
 * and less than 1.0.
 * @description Checks range of result.
 * @author msyabro
 * @reviewer pagolubev
 */

#import("dart:math", prefix: "Math");

main() {
  for(int i = 0; i < 1000; i++) {
    double x = Math.random();
    Expect.isTrue(x < 1 && x >= 0);
  }
}
