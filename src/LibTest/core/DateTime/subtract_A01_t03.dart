/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime subtract(Duration duration)
 * Returns a new DateTime with the duration subtracted from this. 
 * @description Checks that this instance is not modified
 * @author hlodvig
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

void check(DateTime dt, y, m, d, h, min, s, ms){
  Expect.equals(y, dt.year);
  Expect.equals(m, dt.month);
  Expect.equals(d, dt.day);
  Expect.equals(h, dt.hour);
  Expect.equals(min, dt.minute);
  Expect.equals(s, dt.second);
  Expect.equals(ms, dt.millisecond);
}

main() {
  DateTime dt = new DateTime(2001, 2, 3, 4, 5, 6, 7);
  
  dt.subtract(new Duration(days: 1, hours: 1, minutes: 1, seconds: 1, milliseconds: 1));
  check(dt, 2001, 2, 3, 4, 5, 6, 7);

  dt.subtract(new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: 0));
  check(dt, 2001, 2, 3, 4, 5, 6, 7);
  
  dt.subtract(new Duration(days: -10000, hours: -10000, minutes: -10000, seconds: -10000, milliseconds: -10000));
  check(dt, 2001, 2, 3, 4, 5, 6, 7);

  dt.subtract(new Duration(days: 10000, hours: 10000, minutes: 10000, seconds: 10000, milliseconds: 10000));
  check(dt, 2001, 2, 3, 4, 5, 6, 7);
}
