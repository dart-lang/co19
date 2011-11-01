/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final TimeZone timeZone returns the timeZone of this instance.
 * @description Checks that the returned value is correct
 * @author hlodvig
 * @reviewer msyabro
 */
void check(dt, tz){
  Expect.equals(tz, dt.timeZone);
}

main() {
  check(new Date.withTimeZone(1970, 1, 1, 0, 0, 0, 0, new TimeZone.utc()), new TimeZone.utc());
  check(new Date.withTimeZone(1970, 1, 1, 0, 0, 0, 0, new TimeZone.local()), new TimeZone.local());
}
