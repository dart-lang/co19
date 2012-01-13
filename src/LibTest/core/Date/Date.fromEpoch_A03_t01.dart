/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.fromEpoch(int value, TimeZone timeZone) constructs a [Date] instance
 * which represents 1970-01-01T00:00:00Z + [value]ms in the given [timeZone].
 * @description Checks that Date.fromEpoch constructs Date instance with correct values
 * @author hlodvig
 * @reviewer msyabro
 * @needsreview Fails because the implementation takes 1970-01-01T00:00:00 in UTC and adds [value],
 * so [hours] returns hours in the local timezone. Maybe we should not test local timezone?  
 */
void check(dt, y, m, d, h, min, sec, ms, tz){
  Expect.equals(y, dt.year);
  Expect.equals(m, dt.month);
  Expect.equals(d, dt.day);
  Expect.equals(h, dt.hours);
  Expect.equals(min, dt.minutes);
  Expect.equals(sec, dt.seconds);
  Expect.equals(ms, dt.milliseconds);
  Expect.equals(tz, dt.timeZone);
}

main() {
  //check(new Date.fromEpoch(0, new TimeZone.local()), 1970, 1, 1, 0, 0, 0, 0, new TimeZone.local());
  check(new Date.fromEpoch(0, new TimeZone.utc()), 1970, 1, 1, 0, 0, 0, 0, new TimeZone.utc());

  //check(new Date.fromEpoch(1, new TimeZone.local()), 1970, 1, 1, 0, 0, 0, 1, new TimeZone.local());
  check(new Date.fromEpoch(1, new TimeZone.utc()), 1970, 1, 1, 0, 0, 0, 1, new TimeZone.utc());

  //check(new Date.fromEpoch(1000, new TimeZone.local()), 1970, 1, 1, 0, 0, 1, 0, new TimeZone.local());
  check(new Date.fromEpoch(1000, new TimeZone.utc()), 1970, 1, 1, 0, 0, 1, 0, new TimeZone.utc());

  //check(new Date.fromEpoch(1000*60, new TimeZone.local()), 1970, 1, 1, 0, 1, 0, 0, new TimeZone.local());
  check(new Date.fromEpoch(1000*60, new TimeZone.utc()), 1970, 1, 1, 0, 1, 0, 0, new TimeZone.utc());

  //check(new Date.fromEpoch(1000*60*60, new TimeZone.local()), 1970, 1, 1, 1, 0, 0, 0, new TimeZone.local());
  check(new Date.fromEpoch(1000*60*60, new TimeZone.utc()), 1970, 1, 1, 1, 0, 0, 0, new TimeZone.utc());

  //check(new Date.fromEpoch(1000*60*60*24, new TimeZone.local()), 1970, 1, 2, 0, 0, 0, 0, new TimeZone.local());
  check(new Date.fromEpoch(1000*60*60*24, new TimeZone.utc()), 1970, 1, 2, 0, 0, 0, 0, new TimeZone.utc());

  //check(new Date.fromEpoch(-1, new TimeZone.local()), 1969, 12, 31, 23, 59, 59, 999, new TimeZone.local());
  check(new Date.fromEpoch(-1, new TimeZone.utc()), 1969, 12, 31, 23, 59, 59, 999, new TimeZone.utc());

  //check(new Date.fromEpoch(-1000, new TimeZone.local()), 1969, 12, 31, 23, 59, 59, 0, new TimeZone.local());
  check(new Date.fromEpoch(-1000, new TimeZone.utc()), 1969, 12, 31, 23, 59, 59, 0, new TimeZone.utc());

  //check(new Date.fromEpoch(-1000*60, new TimeZone.local()), 1969, 12, 31, 23, 59, 0, 0, new TimeZone.local());
  check(new Date.fromEpoch(-1000*60, new TimeZone.utc()), 1969, 12, 31, 23, 59, 0, 0, new TimeZone.utc());

  //check(new Date.fromEpoch(-1000*60*60, new TimeZone.local()), 1969, 12, 31, 23, 0, 0, 0, new TimeZone.local());
  check(new Date.fromEpoch(-1000*60*60, new TimeZone.utc()), 1969, 12, 31, 23, 0, 0, 0, new TimeZone.utc());

  //check(new Date.fromEpoch(-1000*60*60*24, new TimeZone.local()), 1969, 12, 31, 0, 0, 0, 0, new TimeZone.local());
  check(new Date.fromEpoch(-1000*60*60*24, new TimeZone.utc()), 1969, 12, 31, 0, 0, 0, 0, new TimeZone.utc());
}
