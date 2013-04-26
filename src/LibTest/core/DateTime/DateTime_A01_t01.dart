/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory DateTime(int year, [int month = 1, int day = 1, int hour = 0,
 * int minute = 0, int second = 0, int millisecond = 0])
 * Constructs a DateTime instance based on the individual parts.
 * The date is in the local time zone. month and day are one-based. 
 * @description Checks the DateTime constructor with various correct parameters that are within range and
 * do not result in overflow/underflow of any single field.
 * @author hlodvig
 * @reviewer iefremov
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

check(int year, int month, int day, int hours, int minutes, int seconds, int milliseconds) {
  DateTime date = new DateTime(year, month, day, hours, minutes, seconds, milliseconds);
  String msg = 'actual date is ${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}:${date.second}:${date.millisecond}';
  Expect.equals(year, date.year, msg);
  Expect.equals(month, date.month, msg);
  Expect.equals(day, date.day, msg);
  Expect.equals(hours, date.hour, msg);
  Expect.equals(minutes, date.minute, msg);
  Expect.equals(seconds, date.second, msg);
  Expect.equals(milliseconds, date.millisecond, msg);
  Expect.isTrue(date is DateTime);
}

main() {
  check(2001, 1, 2, 3, 4, 5, 6);
  check(-2000, 1, 2, 0, 0, 0, 0); //2000 B.C.?
  check(0, 1, 1, 0, 0, 0, 0);
  check(2001, 2, 28, 0, 0, 0, 0);
  check(2001, 1, 1, 23, 0, 0, 0);
  check(0xffff, 12, 31, 23, 59, 59, 999);
}
