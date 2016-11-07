/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime subtract(Duration duration)
 * Returns a new DateTime with the duration subtracted from this. 
 * @description Checks that correct values are subtracted from the corresponding properties.
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
  check(new DateTime(2001, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: 0)), 2001, 2, 3, 4, 5, 6, 7);

  check(new DateTime(2001, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: -1, hours: 0, minutes: 0, seconds: 0, milliseconds: 0)), 2001, 2, 4, 4, 5, 6, 7);
  check(new DateTime(2001, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: -1, minutes: 0, seconds: 0, milliseconds: 0)), 2001, 2, 3, 5, 5, 6, 7);
  check(new DateTime(2001, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: 0, minutes: -1, seconds: 0, milliseconds: 0)), 2001, 2, 3, 4, 6, 6, 7);
  check(new DateTime(2001, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: 0, minutes: 0, seconds: -1, milliseconds: 0)), 2001, 2, 3, 4, 5, 7, 7);
  check(new DateTime(2001, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: -1)), 2001, 2, 3, 4, 5, 6, 8);

  check(new DateTime(2001, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 1, hours: 0, minutes: 0, seconds: 0, milliseconds: 0)), 2001, 2, 2, 4, 5, 6, 7);
  check(new DateTime(2001, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: 1, minutes: 0, seconds: 0, milliseconds: 0)), 2001, 2, 3, 3, 5, 6, 7);
  check(new DateTime(2001, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: 0, minutes: 1, seconds: 0, milliseconds: 0)), 2001, 2, 3, 4, 4, 6, 7);
  check(new DateTime(2001, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: 0, minutes: 0, seconds: 1, milliseconds: 0)), 2001, 2, 3, 4, 5, 5, 7);
  check(new DateTime(2001, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: 1)), 2001, 2, 3, 4, 5, 6, 6);

  check(new DateTime(2002, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: -365, hours: 0, minutes: 0, seconds: 0, milliseconds: 0)), 2003, 2, 3, 4, 5, 6, 7);
  check(new DateTime(2002, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: -28, hours: 0, minutes: 0, seconds: 0, milliseconds: 0)), 2002, 3, 3, 4, 5, 6, 7);
  check(new DateTime(2002, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: -24, minutes: 0, seconds: 0, milliseconds: 0)), 2002, 2, 4, 4, 5, 6, 7);
  check(new DateTime(2002, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: 0, minutes: -60, seconds: 0, milliseconds: 0)), 2002, 2, 3, 5, 5, 6, 7);
  check(new DateTime(2002, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: 0, minutes: 0, seconds: -60, milliseconds: 0)), 2002, 2, 3, 4, 6, 6, 7);
  check(new DateTime(2002, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: -1000)), 2002, 2, 3, 4, 5, 7, 7);

  check(new DateTime(2002, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 365, hours: 0, minutes: 0, seconds: 0, milliseconds: 0)), 2001, 2, 3, 4, 5, 6, 7);
  check(new DateTime(2016, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 31, hours: 0, minutes: 0, seconds: 0, milliseconds: 0)), 2016, 1, 3, 4, 5, 6, 7);
  check(new DateTime(2002, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: 24, minutes: 0, seconds: 0, milliseconds: 0)), 2002, 2, 2, 4, 5, 6, 7);
  check(new DateTime(2002, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: 0, minutes: 60, seconds: 0, milliseconds: 0)), 2002, 2, 3, 3, 5, 6, 7);
  check(new DateTime(2002, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: 0, minutes: 0, seconds: 60, milliseconds: 0)), 2002, 2, 3, 4, 4, 6, 7);
  check(new DateTime(2002, 2, 3, 4, 5, 6, 7).subtract(new Duration(days: 0, hours: 0, minutes: 0, seconds: 0, milliseconds: 1000)), 2002, 2, 3, 4, 5, 5, 7);
}
