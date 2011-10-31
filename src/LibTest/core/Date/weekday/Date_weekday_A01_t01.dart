/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get weekday() returns the week day [MON..SUN].
 * @description Checks property value when date is valid.
 * @author hlodvig
 * @reviewer msyabro
 */


main() {
  Date date = new Date(1991, 8, 18, 0, 0, 0, 0);
  Expect.equals(Date.SUN, date.weekday);

  date = new Date(1991, 8, 19, 0, 0, 0, 0);
  Expect.equals(Date.MON, date.weekday);

  date = new Date(1991, 8, 20, 0, 0, 0, 0);
  Expect.equals(Date.TUE, date.weekday);

  date = new Date(1991, 8, 21, 0, 0, 0, 0);
  Expect.equals(Date.WED, date.weekday);

  date = new Date(1991, 8, 22, 0, 0, 0, 0);
  Expect.equals(Date.THU, date.weekday);

  date = new Date(1991, 8, 23, 0, 0, 0, 0);
  Expect.equals(Date.FRI, date.weekday);

  date = new Date(1991, 8, 24, 0, 0, 0, 0);
  Expect.equals(Date.SAT, date.weekday);

  date = new Date(1991, 8, 25, 0, 0, 0, 0);
  Expect.equals(Date.SUN, date.weekday);

  date = new Date(2011, 9, 31, 0, 0, 0, 0);
  Expect.equals(Date.SAT, date.weekday);// Dart automatically converts September 31th into October 1st

  date = new Date(1, 1, 1, 0, 0, 0, 0);
  Expect.equals(Date.MON, date.weekday);
}
