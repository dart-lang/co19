/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date add(Duration other) does not affect TimeZone
 * @description Checks that the TimeZone is not affected
 * @author hlodvig
 * @reviewer msyabro
 */

main() {
  Date dt = new Date.withTimeZone(2001, 1, 1, 0, 0, 0, 0, new TimeZone.local());
  dt = dt.add(new Duration(0, 0, 0, 0, 0));
  Expect.equals(new TimeZone.local(), dt.timeZone);

  dt = new Date.withTimeZone(2001, 1, 1, 0, 0, 0, 0, new TimeZone.local());
  dt = dt.add(new Duration(9223372036854775808, 9223372036854775808, 9223372036854775808, 9223372036854775808, 9223372036854775808));
  Expect.equals(new TimeZone.local(), dt.timeZone);

  dt = new Date.withTimeZone(2001, 1, 1, 0, 0, 0, 0, new TimeZone.local());
  dt = dt.add(new Duration(-9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808, 9223372036854775808));
  Expect.equals(new TimeZone.local(), dt.timeZone);
}
