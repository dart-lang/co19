/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date changeTimeZone(TimeZone targetTimeZone) returns [Date]
 *  in the given [targetTimeZone] time zone
 * @description Checks that timeZone is set correctly in the new instance
 * @author hlodvig
 */

void check(dt){
  Expect.equals(new TimeZone.utc(), dt.changeTimeZone(new TimeZone.utc()).timeZone);
  Expect.equals(new TimeZone.local(), dt.changeTimeZone(new TimeZone.local()).timeZone);
  Expect.equals(new TimeZone(new Time(0, 3, 0, 0, 0)), dt.changeTimeZone(new TimeZone(new Time(0, 3, 0, 0, 0))).timeZone);
}

main() {
  check(new Date.withTimeZone(2001, 2, 3, 4, 5, 6, 7, new TimeZone.utc()));
  check(new Date.withTimeZone(2001, 2, 3, 4, 5, 6, 7, new TimeZone.local()));
  check(new Date.withTimeZone(2001, 2, 3, 4, 5, 6, 7, new TimeZone(new Time(0, 3, 0, 0, 0))));
}
