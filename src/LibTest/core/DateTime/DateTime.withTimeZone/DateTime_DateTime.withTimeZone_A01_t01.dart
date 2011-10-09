/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime.withTimeZone(int year, int month, int day, int hours, int minutes, int seconds, int milliseconds, TimeZone timeZone)
 *  constructs a [DateTime] instance based on the individual parts
 * @description Try to pass normal int values
 * @author hlodvig
 * @reviewer iefremov
 */

main(){
  DateTime dt1 = new DateTime.withTimeZone(2001, 1, 2, 3, 4, 5, 6, new TimeZone.utc());
  Expect.equals(2001, dt1.year, 2001);
  Expect.equals(1, dt1.month, 1);
  Expect.equals(2, dt1.day, 2);
  Expect.equals(3, dt1.hours, 3);
  Expect.equals(4, dt1.minutes, 4);
  Expect.equals(5, dt1.seconds, 5);
  Expect.equals(6, dt1.milliseconds, 6);
  Expect.equals(new TimeZone.utc(), dt1.timeZone);
  Expect.isTrue(dt1 is DateTime);

  DateTime dt2 = new DateTime.withTimeZone(2001, 1, 2, 3, 4, 5, 6, new TimeZone.local());
  Expect.equals(2001, dt2.year);
  Expect.equals(1, dt2.month);
  Expect.equals(2, dt2.day);
  Expect.equals(3, dt2.hours);
  Expect.equals(4, dt2.minutes);
  Expect.equals(5, dt2.seconds);
  Expect.equals(6, dt2.milliseconds);
  Expect.equals(new TimeZone.local(), dt2.timeZone);
  Expect.isTrue(dt2 is DateTime);

  DateTime dt3 = new DateTime.withTimeZone(2001, 1, 2, 3, 4, 5, 6, new TimeZone(new Time(0, 3, 0, 0, 0)));
  Expect.equals(2001, dt3.year);
  Expect.equals(1, dt3.month);
  Expect.equals(2, dt3.day);
  Expect.equals(3, dt3.hours);
  Expect.equals(4, dt3.minutes);
  Expect.equals(5, dt3.seconds);
  Expect.equals(6, dt3.milliseconds);
  Expect.equals(new TimeZone(new Time(0, 3, 0, 0, 0)), dt3.timeZone);
  Expect.isTrue(dt3 is DateTime);
}
