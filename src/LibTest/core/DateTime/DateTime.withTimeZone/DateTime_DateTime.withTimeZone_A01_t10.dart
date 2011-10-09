/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime.withTimeZone(int year, int month, int day, int hours, int minutes, int seconds, int milliseconds, TimeZone timeZone) 
 *  constructs a [DateTime] instance based on the individual parts
 * @description Try to pass null value as each argument.
 * @author hlodvig
 * @reviewer iefremov
 * @needsreview
 */

void check(y, m, d, h, min, sec, ms, tz) {
  try {
    new DateTime.withTimeZone(y, m, d, h, min, sec, ms, tz);
    Expect.fail("NullPointerException expected");
  } catch(NullPointerException ok) {}
}

main(){
  check(null, 1, 1, 1, 1, 1, 1, new TimeZone.utc());
  check(1, null, 1, 1, 1, 1, 1, new TimeZone.utc());
  check(1, 1, null, 1, 1, 1, 1, new TimeZone.utc());
  check(1, 1, 1, null, 1, 1, 1, new TimeZone.utc());
  check(1, 1, 1, 1, null, 1, 1, new TimeZone.utc());
  check(1, 1, 1, 1, 1, null, 1, new TimeZone.utc());
  check(1, 1, 1, 1, 1, 1, null, new TimeZone.utc());
  check(1, 1, 1, 1, 1, 1, 1, null);
}
