/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date add(Time other) returns a new [Date]
 * @description Checks that this instance is not modified
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
  Date dt = new Date(2001, 2, 3, 4, 5, 6, 7);
  dt.add(new Time(1, 1, 1, 1, 1));
  
  check(dt, 2001, 2, 3, 4, 5, 6, 7);
}
