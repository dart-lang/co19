/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toIso8601String()
 * Returns an ISO-8601 full-precision extended format representation.
 *
 * The format is yyyy-MM-ddTHH:mm:ss.mmmuuuZ for UTC time, and
 * yyyy-MM-ddTHH:mm:ss.mmmuuu (no trailing "Z") for local/non-UTC time, where:
 *
 * yyyy is a, possibly negative, four digit representation of the year,
 * if the year is in the range -9999 to 9999, otherwise it is a signed six digit
 * representation of the year.
 * MM is the month in the range 01 to 12,
 * dd is the day of the month in the range 01 to 31,
 * HH are hours in the range 00 to 23,
 * mm are minutes in the range 00 to 59,
 * ss are seconds in the range 00 to 59 (no leap seconds),
 * mmm are milliseconds in the range 000 to 999, and
 * uuu are microseconds in the range 001 to 999. If microsecond equals 0,
 * then this part is omitted.
 * The resulting string can be parsed back using parse.
 * @description Check that string returned by toIso8601String() can be parsed
 * back using parse
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var now = new DateTime.now();
  var date = DateTime.parse(now.toIso8601String());
  Expect.equals(now.toIso8601String(), date.toIso8601String());
  Expect.equals(now.microsecondsSinceEpoch, date.microsecondsSinceEpoch);
}
