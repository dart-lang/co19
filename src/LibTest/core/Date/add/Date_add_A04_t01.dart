/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date add(Time other) do not affect timeZone
 * @description Checks that the timeZone is not affected
 * @author hlodvig
 */

main() {
  Date dt = new Date.withTimeZone(2001, 1, 1, 0, 0, 0, 0, new TimeZone(new Time(0, 3, 0, 0, 0)));
  dt = dt.add(new Time(0, 0, 0, 0, 0));
  Expect.equals(new TimeZone(new Time(0, 3, 0, 0, 0)), dt.timeZone);

  dt = new Date.withTimeZone(2001, 1, 1, 0, 0, 0, 0, new TimeZone(new Time(0, 7, 0, 0, 0)));
  dt = dt.add(new Time(9223372036854775808, 9223372036854775808, 9223372036854775808, 9223372036854775808, 9223372036854775808));
  Expect.equals(new TimeZone(new Time(0, 7, 0, 0, 0)), dt.timeZone);

  dt = new Date.withTimeZone(2001, 1, 1, 0, 0, 0, 0, new TimeZone(new Time(0, -3, 0, 0, 0)));
  dt = dt.add(new Time(-9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808, 9223372036854775808));
  Expect.equals(new TimeZone(new Time(0, -3, 0, 0, 0)), dt.timeZone);
}
