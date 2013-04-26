/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int weekday
 * Returns the week day MON..SUN. In accordance with ISO 8601 a week starts with Monday
 * which has the value 1.
 * @description Checks property value when date is valid.
 * @author hlodvig
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

void check(year, m, d){
  DateTime dt = new DateTime(year, m, d);
  Expect.equals(DateTime.MONDAY, dt.weekday);
  dt = new DateTime(year, m, d+1);
  Expect.equals(DateTime.TUESDAY, dt.weekday);
  dt = new DateTime(year, m, d+2);
  Expect.equals(DateTime.WEDNESDAY, dt.weekday);
  dt = new DateTime(year, m, d+3);
  Expect.equals(DateTime.THURSDAY, dt.weekday);
  dt = new DateTime(year, m, d+4);
  Expect.equals(DateTime.FRIDAY, dt.weekday);
  dt = new DateTime(year, m, d+5);
  Expect.equals(DateTime.SATURDAY, dt.weekday);
  dt = new DateTime(year, m, d+6);
  Expect.equals(DateTime.SUNDAY, dt.weekday);
}

main() {
  check(1, 1, 1);
  check(1951, 1, 8);
  check(1955, 1, 17);
  check(1991, 8, 19);
  check(2011, 10, 3);
  check(2013, 4, 29);
}
