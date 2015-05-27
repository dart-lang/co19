/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime.fromMillisecondsSinceEpoch(int millisecondsSinceEpoch, {bool isUtc: false})
 * Constructs a new DateTime instance with the given millisecondsSinceEpoch.
 * If isUtc is false then the date is in the local time zone.
 * The constructed DateTime represents 1970-01-01T00:00:00Z + millisecondsSinceEpoch ms
 * in the given time zone (local or UTC).
 * @description Checks that a new DateTime object is properly constructed using the UTC time zone.
 * @author hlodvig
 */
import "../../../Utils/expect.dart";

void check(dt, y, m, d, h, min, sec, ms, isUtc){
  Expect.equals(y, dt.year);
  Expect.equals(m, dt.month);
  Expect.equals(d, dt.day);
  Expect.equals(h, dt.hour);
  Expect.equals(min, dt.minute);
  Expect.equals(sec, dt.second);
  Expect.equals(ms, dt.millisecond);
  
  if(isUtc) {
    Expect.identical(dt, dt.toUtc());
  } else {
    Expect.identical(dt, dt.toLocal());  
  }
}

main() {
  check(new DateTime.fromMillisecondsSinceEpoch(0, isUtc: true), 1970, 1, 1, 0, 0, 0, 0, true);
  check(new DateTime.fromMillisecondsSinceEpoch(1, isUtc: true), 1970, 1, 1, 0, 0, 0, 1, true);
  check(new DateTime.fromMillisecondsSinceEpoch(1000, isUtc: true), 1970, 1, 1, 0, 0, 1, 0, true);
  check(new DateTime.fromMillisecondsSinceEpoch(1000*60, isUtc: true), 1970, 1, 1, 0, 1, 0, 0, true);
  check(new DateTime.fromMillisecondsSinceEpoch(1000*60*60, isUtc: true), 1970, 1, 1, 1, 0, 0, 0, true);
  check(new DateTime.fromMillisecondsSinceEpoch(1000*60*60*24, isUtc: true), 1970, 1, 2, 0, 0, 0, 0, true);
  check(new DateTime.fromMillisecondsSinceEpoch(-1, isUtc: true), 1969, 12, 31, 23, 59, 59, 999, true);
  check(new DateTime.fromMillisecondsSinceEpoch(-1000, isUtc: true), 1969, 12, 31, 23, 59, 59, 0, true);
  check(new DateTime.fromMillisecondsSinceEpoch(-1000*60, isUtc: true), 1969, 12, 31, 23, 59, 0, 0, true);
  check(new DateTime.fromMillisecondsSinceEpoch(-1000*60*60, isUtc: true), 1969, 12, 31, 23, 0, 0, 0, true);
  check(new DateTime.fromMillisecondsSinceEpoch(-1000*60*60*24, isUtc: true), 1969, 12, 31, 0, 0, 0, 0, true);
}
