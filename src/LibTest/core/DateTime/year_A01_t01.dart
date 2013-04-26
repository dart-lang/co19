/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int year
 * Returns the year.
 * @description Creates a new DateTime with various integer year values (zero,
 *              positive, negative, equal to and exceeding the extreme values of
 *              32 and 64-bit integers), and reads the value back.
 * @author rodionov
 * @needsreview #8808
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  check(0);
  check(-1);
  check(1991);
  check(-1991);
  check(275760);
  check(275761);
  check(0x7fffff);
  check(0x7fffffff);
  check(0x7fffffffffffffff);
  check(0x8000000000000000);
  check(-0x80000000);
  check(-0x8000000000000000);
  check(-0x8000000000000001);
}

void check(int y) {
  DateTime date = new DateTime(y, 8, 18, 0, 0, 0, 0);
  Expect.isTrue(date.year is int);
  Expect.equals(y, date.year);
}
