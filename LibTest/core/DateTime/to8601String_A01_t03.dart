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
 * @description Check that date converted to expected ISO-8601 string
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  var microseconds = (365 * 24 * 60 * 60 * 1000 * 1000) + // 1 year
      (31 * 24 * 60 * 60 * 1000 * 1000) + // 1 month
      (60 * 60 * 1000 * 1000) + // 1 hour
      (60 * 1000 * 1000) + // 1 minute
      (1000 * 1000) + // 1 second
      (1001); // 1 millisecond and 1 microsecond
  var date = new DateTime.fromMicrosecondsSinceEpoch(microseconds, isUtc: true);
  Expect.equals("1971-02-01T01:01:01.001001Z", date.toIso8601String());
}
