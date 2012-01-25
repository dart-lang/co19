/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date changeTimeZone(TimeZone targetTimeZone)
 * [timeZone] of new instance is set to the local time zone if [targetTimeZone] is null
 * @description Checks that [timeZone] is set to the local time zone
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */

main() {
  Date d = new Date(200, 1, 1, 0, 0, 0, 0).changeTimeZone(null);
  Expect.equals(new TimeZone.local(), d.timeZone);

  d = new Date.withTimeZone(200, 1, 1, 0, 0, 0, 0, new TimeZone.utc()).changeTimeZone(null);
  Expect.equals(new TimeZone.local(), d.timeZone);
}
