/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if the value represented by this int object is negative.
 * @description Checks that this method returns correct value.
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 */

main() {
  Expect.isFalse(0.isNegative);
  
  for (var i = -100; i < 0; i++) {
    Expect.isTrue(i.isNegative);
  }
  
  for (var i = 0; i <= 100; i++){
    Expect.isFalse(i.isNegative);
  }
  Expect.isFalse(9223372036854775808.isNegative);
  Expect.isTrue((-9223372036854775808).isNegative);
  Expect.isFalse(21332142137489273849723146271467234672164712364701264072347213640214702647263407264.isNegative);
  Expect.isTrue((-21332142137489273849723146271467234672164712364701264072347213640214702647263407264).isNegative);
}
