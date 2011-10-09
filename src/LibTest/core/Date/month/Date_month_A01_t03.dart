/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get month()
 * Returns the month of the date [JAN..DEC].
 * @description Checks an exception is thrown if month is out of [JAN..DEC] bound.
 * @author akuznecov
 * @reviewer pagolubev
 * @needsreview Assumes that calling day property on incorrect date will throw an exception(which?).
 */


void check(Date date) {
  try {
    date.month;
    Expect.fail("Exception expected");
  } catch (var e) {}
}

main() {
  check(new Date(1991, 0, 18));
  check(new Date(1991, -1, 18));
  check(new Date(1991, 13, 18));
  check(new Date(1991, 9223372036854775808, 18));
  check(new Date(1991, -9223372036854775809, 18));
}
