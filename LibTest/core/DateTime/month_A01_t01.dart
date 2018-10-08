/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int month
 * Returns the month into the year 1..12.
 * @description Creates a new DateTime with various integer month values (1..12),
 * and reads the value back.
 * @author rodionov
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  check(DateTime.january);
  check(DateTime.february);
  check(DateTime.march);
  check(DateTime.april);
  check(DateTime.may);
  check(DateTime.june);
  check(DateTime.july);
  check(DateTime.august);
  check(DateTime.september);
  check(DateTime.october);
  check(DateTime.november);
  check(DateTime.december);
}

// creates a new DateTime with valid year and day values, and the specified month
// value, then reads it back and verifies that it is an integer and equals the
// previously specified value
void check(int m) {
  DateTime date = new DateTime(2011, m, 18, 0, 0, 0, 0);
  Expect.isTrue(date.month is int);
  Expect.equals(m, date.month);
}
