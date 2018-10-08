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
  Expect.equals(DateTime.monday, dt.weekday);
  dt = new DateTime(year, m, d+1);
  Expect.equals(DateTime.tuesday, dt.weekday);
  dt = new DateTime(year, m, d+2);
  Expect.equals(DateTime.wednesday, dt.weekday);
  dt = new DateTime(year, m, d+3);
  Expect.equals(DateTime.thursday, dt.weekday);
  dt = new DateTime(year, m, d+4);
  Expect.equals(DateTime.friday, dt.weekday);
  dt = new DateTime(year, m, d+5);
  Expect.equals(DateTime.saturday, dt.weekday);
  dt = new DateTime(year, m, d+6);
  Expect.equals(DateTime.sunday, dt.weekday);
}

main() {
  check(1, 1, 1);
  check(1951, 1, 8);
  check(1955, 1, 17);
  check(1991, 8, 19);
  check(2011, 10, 3);
  check(2013, 4, 29);
}
