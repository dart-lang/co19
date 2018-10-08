/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int operator <<(int shiftAmount)
 * This operator implements bit-wise left-shift operation.
 * @description Checks that this operator returns correct value for non-negative
 * and not exceedingly large arguments.
 * @author vasya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0, 0 << 2);
  Expect.equals(1, 1 << 0);
  Expect.equals(14, 7 << 1);
  Expect.equals(36, 9 << 2);
  Expect.equals(32, 4 << 3);
  Expect.equals(14, 7 << 1);
  Expect.equals(52, 13 <<2);
  Expect.equals(16, 1 << 4);
  Expect.equals(0, 0 << 4);
  Expect.equals(4, 4 << 0);
  
  Expect.equals(1024, 1 << 10);
  Expect.equals(512, 1 << 9);
  Expect.equals(256, 1 << 8);
  Expect.equals(128, 1 << 7);
  Expect.equals(64, 1 << 6);
  Expect.equals(32, 1 << 5);
  Expect.equals(16, 1 << 4);
  Expect.equals(8, 1 << 3);
  Expect.equals(4, 1 << 2);
  Expect.equals(2, 1 << 1);
  Expect.equals(1, 1 << 0);
  
  Expect.equals(-1024, -1  << 10);
  Expect.equals(-512, -1 << 9);
  Expect.equals(-256, -1 << 8);
  Expect.equals(-128, -1 << 7);
  Expect.equals(-64, -1 << 6);
  Expect.equals(-32, -1 << 5);
  Expect.equals(-16, -1 << 4);
  Expect.equals(-8, -1 << 3);
  Expect.equals(-4, -1 << 2);
  Expect.equals(-2, -1 << 1);
  Expect.equals(-1, -1 << 0);
}
