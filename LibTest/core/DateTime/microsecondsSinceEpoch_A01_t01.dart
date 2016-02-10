/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int microsecondsSinceEpoch
 * The number of microseconds since the "Unix epoch" 1970-01-01T00:00:00Z (UTC).
 *
 * This value is independent of the time zone.
 *
 * This value is at most 8,640,000,000,000,000,000us (100,000,000 days) from
 * the Unix epoch. In other words:
 * microsecondsSinceEpoch.abs() <= 8640000000000000000.
 *
 * Note that this value does not fit into 53 bits (the size of a IEEE double).
 * A JavaScript number is not able to hold this value.
 * @description Checks that the getter returns correct values.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(us) {
  Expect.equals(us, new DateTime.fromMicrosecondsSinceEpoch(us,
      isUtc: true).microsecondsSinceEpoch);
  Expect.equals(us, new DateTime.fromMicrosecondsSinceEpoch(us,
      isUtc: false).microsecondsSinceEpoch);
}

main() {
  check(5);
  check(0);
  check(1);
  check(-1);
  check(-100);
  check(6031769);
  check(60317690009);
  check(8640000000000000);
  check(-8640000000000000);
}
