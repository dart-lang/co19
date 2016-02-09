/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime.parse(String formattedString)
 * Constructs a new [DateTime] instance based on [formattedString]
 * @description Checks that from the correct string the correct data is created.
 * @author msyabro
 * @reviewer pagolubev
 */
import "../../../Utils/expect.dart";

check(String str, int year, int month, int day, int hours, int minutes,
    int seconds, int milliseconds) {
  DateTime d = DateTime.parse(str);
  Expect.equals(year, d.year);
  Expect.equals(month, d.month);
  Expect.equals(day, d.day);
  Expect.equals(hours, d.hour);
  Expect.equals(minutes, d.minute);
  Expect.equals(seconds, d.second);
  Expect.equals(milliseconds, d.millisecond);
}

main() {
  check("2001-01-01 23:23:23.23", 2001, 1, 1, 23, 23, 23, 230);
  check("-2001-05-20 02:03:00.0", -2001, 5, 20, 2, 3, 0, 0);
  check("2001-01-01 23:23:23.023", 2001, 1, 1, 23, 23, 23, 23);
  check("0005-01-01 00:00:00.0", 5, 1, 1, 0, 0, 0, 0);
  check("1845-11-30 12:00:00.275", 1845, 11, 30, 12, 0, 0, 275);
  check("30000-11-30 12:00:00.275", 30000, 11, 30, 12, 0, 0, 275);
  
  //Without some components
  check("2000-01-01", 2000, 1, 1, 0, 0, 0, 0);
  check("2000-01-01 12", 2000, 1, 1, 12, 0, 0, 0);
  check("2000-01-01 12:55", 2000, 1, 1, 12, 55, 0, 0);
  check("2001-01-01 23:23:23", 2001, 1, 1, 23, 23, 23, 0);

  //DateTime jumping: is it correct behavior?
  check("2000-02-30 00:00:00", 2000, 3, 1, 0, 0, 0, 0);
  check("2000-06-31 00:00:00", 2000, 7, 1, 0, 0, 0, 0);

  //With 'T' separates date and time
  check("2000-01-01T15:25:12.03", 2000, 1, 1, 15, 25, 12, 30);

  //UTC
  check('0001-01-01 00:00:00.000Z', 1, 1, 1, 0, 0, 0, 0);
  check('1999-10-20 11:12:13.014Z', 1999, 10, 20, 11, 12, 13, 14);
}
