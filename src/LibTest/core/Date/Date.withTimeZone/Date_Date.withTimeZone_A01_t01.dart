/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.withTimeZone(int year, int month, int day, int hours, int minutes, int seconds, int milliseconds, TimeZone timeZone)
 *  constructs a [Date] instance based on the individual parts
 * @description Normal int values passed as arguments.
 * @author hlodvig
 * @reviewer iefremov
 * @reviewer msyabro
 */

main(){
  Date dt1 = new Date.withTimeZone(2001, 1, 2, 3, 4, 5, 6, new TimeZone.utc());
  Expect.equals(2001, dt1.year);
  Expect.equals(1, dt1.month);
  Expect.equals(2, dt1.day);
  Expect.equals(3, dt1.hours);
  Expect.equals(4, dt1.minutes);
  Expect.equals(5, dt1.seconds);
  Expect.equals(6, dt1.milliseconds);
  Expect.equals(new TimeZone.utc(), dt1.timeZone);

  Date dt2 = new Date.withTimeZone(2001, 1, 2, 3, 4, 5, 6, new TimeZone.local());
  Expect.equals(2001, dt2.year);
  Expect.equals(1, dt2.month);
  Expect.equals(2, dt2.day);
  Expect.equals(3, dt2.hours);
  Expect.equals(4, dt2.minutes);
  Expect.equals(5, dt2.seconds);
  Expect.equals(6, dt2.milliseconds);
  Expect.equals(new TimeZone.local(), dt2.timeZone);
}
