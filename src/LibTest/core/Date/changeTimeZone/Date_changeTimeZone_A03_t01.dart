/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date changeTimeZone(TimeZone targetTimeZone) returns a new [Date]
 * @description Checks that this instance is not modified
 * @author hlodvig
 * @reviewer msyabro
 */

void check(dt, tz){
  dt.changeTimeZone(new TimeZone.utc());
  Expect.equals(tz, dt.timeZone);
  
  dt.changeTimeZone(new TimeZone.local());
  Expect.equals(tz, dt.timeZone);
}

main() {
  check(new Date.withTimeZone(2001, 2, 3, 4, 5, 6, 7, new TimeZone.utc()), new TimeZone.utc());
  check(new Date.withTimeZone(2001, 2, 3, 4, 5, 6, 7, new TimeZone.local()), new TimeZone.local());
}
