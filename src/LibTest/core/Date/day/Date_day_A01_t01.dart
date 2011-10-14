/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get day();
 * Returns the day of the date [1..31].
 * @description Creates a new Date with various integer day values (1..31, zero,
 *              positive, negative, equal to and exceeding the extreme values of
 *              32 and 64-bit integers and reads the value back. No error is
 *              expected as the constructor doesn't perform any checks on its
 *              arguments.
 * @author rodionov
 */


main() {
  check(1);
  check(10);
  check(31);
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

void check(int d) {
  Date date = new Date(2011, 8, d);
  Expect.isTrue(date.day is int);
  Expect.equals(d, date.day);
}