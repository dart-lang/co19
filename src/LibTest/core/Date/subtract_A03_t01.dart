/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date subtract(Duration other) returns a new instance of [Date]
 * @description Checks that this instance is not modified
 * @author hlodvig
 * @reviewer msyabro
 */

void check(Date dt, y, m, d, h, min, s, ms){
  Expect.equals(y, dt.year);
  Expect.equals(m, dt.month);
  Expect.equals(d, dt.day);
  Expect.equals(h, dt.hour);
  Expect.equals(min, dt.minute);
  Expect.equals(s, dt.second);
  Expect.equals(ms, dt.millisecond);
}

main() {
  Date dt = new Date(2001, 2, 3, 4, 5, 6, 7);
  
  dt.subtract(new Duration(1, 1, 1, 1, 1));
  check(dt, 2001, 2, 3, 4, 5, 6, 7);

  dt.subtract(new Duration(0, 0, 0, 0, 0));
  check(dt, 2001, 2, 3, 4, 5, 6, 7);
  
  dt.subtract(new Duration(-10000, -10000, -10000, -10000, -10000));
  check(dt, 2001, 2, 3, 4, 5, 6, 7);

  dt.subtract(new Duration(10000, 10000, 10000, 10000, 10000));
  check(dt, 2001, 2, 3, 4, 5, 6, 7);
}
