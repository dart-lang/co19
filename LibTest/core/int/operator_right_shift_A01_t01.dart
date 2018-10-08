/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int operator >>(int shiftAmount)
 * This operator implements bit-wise right-shift operation.
 * @description Checks that this operator returns correct value for non-negative
 * and not exceedingly large arguments.
 * @author vasya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0, 0 >> 3);
  Expect.equals(-2, -4 >> 1);
  Expect.equals(100, 100 >> 0);
  Expect.equals(0, 1 >> 1);

  Expect.equals(4, 9 >> 1);
  Expect.equals(2, 9 >> 2);
  Expect.equals(1, 9 >> 3);

  Expect.equals(5, 21 >> 2);
  Expect.equals(2, 21 >> 3);
  Expect.equals(1, 21 >> 4);

  Expect.equals(1024, 1024 >> 0);
  Expect.equals(512, 1024 >> 1);
  Expect.equals(256, 1024 >> 2);
  Expect.equals(128, 1024 >> 3);
  Expect.equals(64, 1024 >> 4);
  Expect.equals(32, 1024 >> 5);
  Expect.equals(16, 1024 >> 6);
  Expect.equals(8, 1024 >> 7);
  Expect.equals(4, 1024 >> 8);
  Expect.equals(2, 1024 >> 9);
  Expect.equals(1, 1024 >> 10);
  Expect.equals(0, 1024 >> 11);
  Expect.equals(0, 1024 >> 12);

  Expect.equals(-1024, -1024 >> 0);
  Expect.equals(-512, -1024 >> 1);
  Expect.equals(-256, -1024 >> 2);
  Expect.equals(-128, -1024 >> 3);
  Expect.equals(-64, -1024 >> 4);
  Expect.equals(-32, -1024 >> 5);
  Expect.equals(-16, -1024 >> 6);
  Expect.equals(-8, -1024 >> 7);
  Expect.equals(-4, -1024 >> 8);
  Expect.equals(-2, -1024 >> 9);
  Expect.equals(-1, -1024 >> 10);
  Expect.equals(-1, -1024 >> 11);
  Expect.equals(-1, -1024 >> 12);

  Expect.equals(0, 100 >> 500);
}
