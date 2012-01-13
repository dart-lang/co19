/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.fromString(String formattedString) constructs a new [Date] instance
 * based on [formattedString]
 * @description Checks that missing parts in [formattedString] are assigned to 0.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview This is not documented behavior.
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

checkEx(String str) {  // It's IllegalArgumentException if a month or a day is 0
  try {
    new Date.fromString(str);
    Expect.fail("IllegalArgumentException is expected");
  } catch(IllegalArgumentException e) {}
}

main() {
  check("-1-1 0:0:0.0", 0, 1, 1, 0, 0, 0, 0);
  check("2000-1-1 :0:0.0", 2000, 1, 1, 0, 0, 0, 0);
  check("2000-1-1 0::0.0", 2000, 1, 1, 0, 0, 0, 0);
  check("2000-1-1 0:0:.0", 2000, 1, 1, 0, 0, 0, 0);
  check("2000-1-1 0:0:0", 2000, 1, 1, 0, 0, 0, 0);
  check("2000-1-1 0:0:0.", 2000, 1, 1, 0, 0, 0, 0);

  checkEx("2000--1 0:0:0.0");
  checkEx("2000-1- 0:0:0.0");
  checkEx("--- ::.");
}