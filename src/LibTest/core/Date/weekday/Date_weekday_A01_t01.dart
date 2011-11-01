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
 * @needsreview which day of week is the January, 1 of 0001? I suppose it should be monday.
 */

void check(year, m, d){
  Date dt = new Date(year, m, d, 0, 0, 0, 0);
  Expect.equals(Date.SUN, dt.weekday);
  dt = new Date(year, m, d+1, 0, 0, 0, 0);
  Expect.equals(Date.MON, dt.weekday);
  dt = new Date(year, m, d+2, 0, 0, 0, 0);
  Expect.equals(Date.TUE, dt.weekday);
  dt = new Date(year, m, d+3, 0, 0, 0, 0);
  Expect.equals(Date.WED, dt.weekday);
  dt = new Date(year, m, d+4, 0, 0, 0, 0);
  Expect.equals(Date.THU, dt.weekday);
  dt = new Date(year, m, d+5, 0, 0, 0, 0);
  Expect.equals(Date.FRI, dt.weekday);
  dt = new Date(year, m, d+6, 0, 0, 0, 0);
  Expect.equals(Date.SAT, dt.weekday);
}

main() {
  check(1991, 8, 18);
  check(1951, 1, 7);

  Date date = new Date(2011, 9, 31, 0, 0, 0, 0);
  Expect.equals(Date.SAT, date.weekday);// Dart automatically converts September 31th into October 1st

  date = new Date(1, 1, 1, 0, 0, 0, 0);
  Expect.equals(Date.MON, date.weekday);
}
