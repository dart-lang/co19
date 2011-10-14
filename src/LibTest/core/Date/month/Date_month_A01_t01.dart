/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get month() Returns the month of the date [JAN..DEC].
 * @description Creates a new Date with various integer month values (1..12,
 *              zero, positive, negative, equal to and exceeding the extreme
 *              values of 32 and 64-bit integers), and reads the value back. No
 *              error is expected as the constructor doesn't perform any checks
 *              on its arguments.
 * @author rodionov
 */


main() {
  check(Date.JAN);
  check(Date.FEB);
  check(Date.MAR);
  check(Date.APR);
  check(Date.MAY);
  check(Date.JUN);
  check(Date.JUL);
  check(Date.AUG);
  check(Date.SEP);
  check(Date.OCT);
  check(Date.NOV);
  check(Date.DEC);
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

// creates a new Date with valid year and day values, and the specified month
// value, then reads it back and verifies that it is an integer and equals the
// previously specified value
void check(int m) {
  Date date = new Date(2011, m, 18);
  Expect.isTrue(date.month is int);
  Expect.equals(m, date.month);
}