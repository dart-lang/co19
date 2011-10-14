/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date add(Time other) add the time [other]
 * @description Checks that correct values are added to the corresponding properties.
 * @author hlodvig
 */

void check(Date dt, y, m, d, h, min, s, ms){
  Expect.equals(y, dt.year);
  Expect.equals(m, dt.month);
  Expect.equals(d, dt.day);
  Expect.equals(h, dt.hours);
  Expect.equals(min, dt.minutes);
  Expect.equals(s, dt.seconds);
  Expect.equals(ms, dt.milliseconds);
}

main() {
  check(new Date(2001, 2, 3, 4, 5, 6, 7).add(new Time(0, 0, 0, 0, 0)), 2001, 2, 3, 4, 5, 6, 7);

  check(new Date(2001, 2, 3, 4, 5, 6, 7).add(new Time(1, 0, 0, 0, 0)), 2001, 2, 4, 4, 5, 6, 7);
  check(new Date(2001, 2, 3, 4, 5, 6, 7).add(new Time(0, 1, 0, 0, 0)), 2001, 2, 3, 5, 5, 6, 7);
  check(new Date(2001, 2, 3, 4, 5, 6, 7).add(new Time(0, 0, 1, 0, 0)), 2001, 2, 3, 4, 6, 6, 7);
  check(new Date(2001, 2, 3, 4, 5, 6, 7).add(new Time(0, 0, 0, 1, 0)), 2001, 2, 3, 4, 5, 7, 7);
  check(new Date(2001, 2, 3, 4, 5, 6, 7).add(new Time(0, 0, 0, 0, 1)), 2001, 2, 3, 4, 5, 6, 8);

  check(new Date(2001, 2, 3, 4, 5, 6, 7).add(new Time(-1, 0, 0, 0, 0)), 2001, 2, 2, 4, 5, 6, 7);
  check(new Date(2001, 2, 3, 4, 5, 6, 7).add(new Time(0, -1, 0, 0, 0)), 2001, 2, 3, 3, 5, 6, 7);
  check(new Date(2001, 2, 3, 4, 5, 6, 7).add(new Time(0, 0, -1, 0, 0)), 2001, 2, 3, 4, 4, 6, 7);
  check(new Date(2001, 2, 3, 4, 5, 6, 7).add(new Time(0, 0, 0, -1, 0)), 2001, 2, 3, 4, 5, 5, 7);
  check(new Date(2001, 2, 3, 4, 5, 6, 7).add(new Time(0, 0, 0, 0, -1)), 2001, 2, 3, 4, 5, 6, 6);

  check(new Date(2002, 2, 3, 4, 5, 6, 7).add(new Time(365, 0, 0, 0, 0)), 2003, 2, 3, 4, 5, 6, 7);
  check(new Date(2002, 2, 3, 4, 5, 6, 7).add(new Time(28, 0, 0, 0, 0)), 2002, 3, 3, 4, 5, 6, 7);
  check(new Date(2002, 2, 3, 4, 5, 6, 7).add(new Time(0, 24, 0, 0, 0)), 2002, 2, 4, 4, 5, 6, 7);
  check(new Date(2002, 2, 3, 4, 5, 6, 7).add(new Time(0, 0, 60, 0, 0)), 2002, 2, 3, 5, 5, 6, 7);
  check(new Date(2002, 2, 3, 4, 5, 6, 7).add(new Time(0, 0, 0, 60, 0)), 2002, 2, 3, 4, 6, 6, 7);
  check(new Date(2002, 2, 3, 4, 5, 6, 7).add(new Time(0, 0, 0, 0, 1000)), 2002, 2, 3, 4, 5, 7, 7);

  check(new Date(2002, 2, 3, 4, 5, 6, 7).add(new Time(-365, 0, 0, 0, 0)), 2001, 2, 3, 4, 5, 6, 7);
  check(new Date(2002, 2, 3, 4, 5, 6, 7).add(new Time(-31, 0, 0, 0, 0)), 2002, 1, 3, 4, 5, 6, 7);
  check(new Date(2002, 2, 3, 4, 5, 6, 7).add(new Time(0, -24, 0, 0, 0)), 2002, 2, 2, 4, 5, 6, 7);
  check(new Date(2002, 2, 3, 4, 5, 6, 7).add(new Time(0, 0, -60, 0, 0)), 2002, 2, 3, 3, 5, 6, 7);
  check(new Date(2002, 2, 3, 4, 5, 6, 7).add(new Time(0, 0, 0, -60, 0)), 2002, 2, 3, 4, 4, 6, 7);
  check(new Date(2002, 2, 3, 4, 5, 6, 7).add(new Time(0, 0, 0, 0, -1000)), 2002, 2, 3, 4, 5, 5, 7);

  check(new Date(2002, 2, 3, 4, 5, 6, 7).add(new Time(330, 19, 54, 53, 993)), 2002, 12, 31, 0, 0, 0, 0);
  check(new Date(2002, 2, 3, 4, 5, 6, 7).add(new Time(331, 19, 54, 53, 993)), 2003, 1, 1, 0, 0, 0, 0);
}
