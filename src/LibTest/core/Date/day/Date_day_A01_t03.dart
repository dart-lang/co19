/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get month();
 * Returns the day of the date [1..31].
 * @description Checks exception is thrown when the date is incorrect.
 * @author akuznecov
 * @reviewer pagolubev
 * @needsreview Assumes that calling day property on incorrect date will throw an exception(which?).
 */


void check(Date date) {
  try {
    date.day;
    Expect.fail("Exception expected.");
  } catch (var e) {}
}

main() {
  check(new Date(1991, 8, 0));
  check(new Date(1991, 8, -1));
  check(new Date(1991, 8, 32));
  check(new Date(1991, 8, 9223372036854775808));
  check(new Date(1991, 8, -9223372036854775809));
  check(new Date(1991, 7, 31));

  // leap years: (year % 4 == 0) && !(year % 100 == 0 and year % 400 != 0) is leap
  // non leap
  check(new Date(3, Date.FEB, 29));
  check(new Date(100, Date.FEB, 29));
  check(new Date(1991, Date.FEB, 29));
  // leap
  Date date;
  date = new Date(16, Date.FEB, 29);
  Expect.isTrue(date.day == 29);

  check(new Date(16, Date.FEB, 30));

  date = new Date(400, Date.FEB, 29));
  Expect.isTrue(date.day == 29);

  check(new Date(400, Date.FEB, 30));
}
