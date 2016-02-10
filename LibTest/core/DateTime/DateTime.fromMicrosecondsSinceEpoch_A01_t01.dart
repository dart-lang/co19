/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime.fromMicrosecondsSinceEpoch(int microsecondsSinceEpoch,
 * {bool isUtc: false})
 * Constructs a new DateTime instance with the given microsecondsSinceEpoch.
 *
 * If isUtc is false then the date is in the local time zone.
 *
 * The constructed DateTime represents 1970-01-01T00:00:00Z +
 * microsecondsSinceEpoch us in the given time zone (local or UTC).
 * @description Checks that a new DateTime object is properly constructed using
 * the UTC time zone.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

void test(value, y, m, d, h, min, sec, ms, us) {
  check(new DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true),
      y, m, d, h, min, sec, ms, us, true);
  check(new DateTime.fromMicrosecondsSinceEpoch(value, isUtc: false),
      y, m, d, h, min, sec, ms, us, false);
}

void check(date, y, m, d, h, min, sec, ms, us, isUtc) {
  var dt = date.toUtc();
  Expect.equals(y, dt.year);
  Expect.equals(m, dt.month);
  Expect.equals(d, dt.day);
  Expect.equals(h, dt.hour);
  Expect.equals(min, dt.minute);
  Expect.equals(sec, dt.second);
  Expect.equals(ms, dt.millisecond);
  Expect.equals(us, dt.microsecond);
  
  if(isUtc) {
    Expect.identical(date, date.toUtc());
  } else {
    Expect.identical(date, date.toLocal());
  }
}

main() {
  test(0, 1970, 1, 1, 0, 0, 0, 0, 0);
  test(1, 1970, 1, 1, 0, 0, 0, 0, 1);
  test(1000, 1970, 1, 1, 0, 0, 0, 1, 0);
  test(1000 * 1000, 1970, 1, 1, 0, 0, 1, 0, 0);
  test(1000 * 1000 * 60, 1970, 1, 1, 0, 1, 0, 0, 0);
  test(1000 * 1000 * 60 * 60, 1970, 1, 1, 1, 0, 0, 0, 0);
  test(1000 * 1000 * 60 * 60 * 24, 1970, 1, 2, 0, 0, 0, 0, 0);
  test(-1, 1969, 12, 31, 23, 59, 59, 999, 999);
  test(-1000, 1969, 12, 31, 23, 59, 59, 999, 0);
  test(-1000 * 1000, 1969, 12, 31, 23, 59, 59, 0, 0);
  test(-1000 * 1000 * 60, 1969, 12, 31, 23, 59, 0, 0, 0);
  test(-1000 * 1000 * 60 * 60, 1969, 12, 31, 23, 0, 0, 0, 0);
  test(-1000 * 1000 * 60 * 60 * 24, 1969, 12, 31, 0, 0, 0, 0, 0);
}
