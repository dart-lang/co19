/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get year() Returns the year of the date.
 * @description Creates a new Date with various integer year values (zero,
 *              positive, negative, equal to and exceeding the extreme values of
 *              32 and 64-bit integers), and reads the value back.
 * @author rodionov
 * @reviewer msyabro
 */


main() {
  check(0);
  check(-1);
  check(1991);
  check(-1991);
  check(0x7fffffff);
  check(0x7fffffffffffffff);
  check(0x8000000000000000);
  check(-0x80000000);
  check(-0x8000000000000000);
  check(-0x8000000000000001);
}

void check(int y) {
  Date date = new Date(y, 8, 18, 0, 0, 0, 0);
  Expect.isTrue(date.year is int);
  Expect.equals(y, date.year);
}
