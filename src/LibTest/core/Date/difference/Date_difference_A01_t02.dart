/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Duration difference(Date other) returns a [Duration] with the difference of [:this:] and [other]
 * @description Checks that the method returns correct value
 * @author hlodvig
 * @reviewer msyabro
 */
void check(val1, val2, expected){
  Date dt1 = new Date.fromEpoch(val1, new TimeZone.local());
  Date dt2 = new Date.fromEpoch(val2, new TimeZone.local());
  Expect.equals(new Duration(milliseconds: expected), dt1.difference(dt2));
  Expect.equals(new Duration(milliseconds: -expected), dt2.difference(dt1));

  dt1 = new Date.fromEpoch(val1, new TimeZone.utc());
  dt2 = new Date.fromEpoch(val2, new TimeZone.utc());
  Expect.equals(new Duration(milliseconds: expected), dt1.difference(dt2));
  Expect.equals(new Duration(milliseconds: -expected), dt2.difference(dt1));
}

main() {
  check(0, 0, 0);
  check(0, 1000, -1000);
  check(0, -1000, 1000);
  check(1000, 0, 1000);
  check(-1000, 0, -1000);
  check(1000, 1000, 0);
}
