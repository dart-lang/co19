/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.withTimeZone(int year, int month, int day, int hours, int minutes, int seconds, int milliseconds, TimeZone timeZone)
 *  constructs a [Date] instance based on the individual parts
 * @description Tries to pass null value as one of the arguments.
 * @author hlodvig
 * @reviewer iefremov
 * @needsreview
 */

void check(y, m, d, h, min, sec, ms, tz, field) {
  try {
    new Date.withTimeZone(y, m, d, h, min, sec, ms, tz);
    Expect.fail("NullPointerException expected with the passed null value of the "+field);
  } catch(NullPointerException ok) {}
}

main() {
  check(null, 1, 1, 1, 1, 1, 1, new TimeZone.utc(), "year");
  check(1, null, 1, 1, 1, 1, 1, new TimeZone.utc(), "month");
  check(1, 1, null, 1, 1, 1, 1, new TimeZone.utc(), "day");
  check(1, 1, 1, null, 1, 1, 1, new TimeZone.utc(), "hours");
  check(1, 1, 1, 1, null, 1, 1, new TimeZone.utc(), "minutes");
  check(1, 1, 1, 1, 1, null, 1, new TimeZone.utc(), "seconds");
  check(1, 1, 1, 1, 1, 1, null, new TimeZone.utc(), "milliseconds");
  check(1, 1, 1, 1, 1, 1, 1, null, "timeZone");
}
