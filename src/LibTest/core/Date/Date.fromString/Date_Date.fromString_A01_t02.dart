/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.fromString(String formattedString) constructs a new [Date] instance
 * based on [formattedString]
 * @description Checks that from the correct string created the correct data.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview Format is not specified. The assumption was made by the results of [:toString():].
 * How to set negative year?
 */

check(String str, int year, int month, int day, int hours, int minutes, int seconds, int milliseconds) {
  Date d = new Date.fromString(str);
  Expect.equals(year, d.year);
  Expect.equals(month, d.month);
  Expect.equals(day, d.day);
  Expect.equals(hours, d.hours);
  Expect.equals(minutes, d.minutes);
  Expect.equals(seconds, d.seconds);
  Expect.equals(milliseconds, d.milliseconds);
}

main() {
  check("2001-01-01 23:23:23.23", 2001, 1, 1, 23, 23, 23, 23);
  check("5-00000001-1 0:0:0.0", 5, 1, 1, 0, 0, 0, 0);
  check("1845-11-30 12:00:00.275", 1845, 11, 30, 12, 0, 0, 275);
}
