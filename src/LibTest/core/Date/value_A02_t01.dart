/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int value is independent of [timeZone] 
 * @description Checks that the same value gives the same result
 * @author hlodvig
 */

main() {
  Date dt1 = new Date.now();
  Date dt2 = new Date.fromEpoch(dt1.value, new TimeZone.local());
  Date dt3 = new Date.fromEpoch(dt1.value, new TimeZone.utc());
  Expect.equals(dt1.value, dt2.value);
  Expect.equals(dt1.value, dt3.value);
}
