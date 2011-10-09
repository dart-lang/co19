/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get weekday()
 * Returns the week day [MON..SUN]. If the date is invalid throws an exception.
 * @description Some checks on weekday's returned value.
 * @author akuznecov
 * @reviewer pagolubev
 */


main() {
  Date date;

  date = new Date(1991, 8, 18);
  Expect.isTrue(date.weekday == Date.SUN);

  date = new Date(1991, 8, 19);
  Expect.isTrue(date.weekday == Date.MON);

  date = new Date(1991, 8, 20);
  Expect.isTrue(date.weekday == Date.TUE);

  date = new Date(1991, 8, 21);
  Expect.isTrue(date.weekday == Date.WED);

  date = new Date(1991, 8, 22);
  Expect.isTrue(date.weekday == Date.THU);

  date = new Date(1991, 8, 23);
  Expect.isTrue(date.weekday == Date.FRI);

  date = new Date(1991, 8, 24);
  Expect.isTrue(date.weekday == Date.SAT);

  date = new Date(1991, 8, 25);
  Expect.isTrue(date.weekday == Date.SUN);
}
