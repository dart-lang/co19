/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int value returns milliseconds from 1970-01-01T00:00:00Z (UTC). 
 * @description Checks that the returned value is correct
 * @author hlodvig
 * @reviewer msyabro
 */
void check(dt, ms){
  Expect.equals(ms, dt.value);
}

main() {
  check(new Date.withTimeZone(1970, 1, 1, 0, 0, 0, 0, new TimeZone.utc()), 0);
  check(new Date.withTimeZone(1970, 1, 1, 0, 0, 0, 1, new TimeZone.utc()), 1);
  check(new Date.withTimeZone(1969, 12, 31, 23, 59, 59, 999, new TimeZone.utc()), -1);
}
