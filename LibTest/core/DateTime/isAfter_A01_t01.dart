/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isAfter(DateTime other)
 * Returns true if this occurs after other.
 * The comparison is independent of whether the time is in UTC or in the local time zone.
 * @description Checks that true is returned only if this occurs after the argument.
 * @author kaigorodov
 */

import "../../../Utils/expect.dart";

checkTrue(t1, t2) {
  Expect.isTrue((new DateTime.fromMillisecondsSinceEpoch(t1, isUtc: true))
    .isAfter(new DateTime.fromMillisecondsSinceEpoch(t2, isUtc: true)));

  Expect.isTrue((new DateTime.fromMillisecondsSinceEpoch(t1, isUtc: false))
    .isAfter(new DateTime.fromMillisecondsSinceEpoch(t2, isUtc: true)));

  Expect.isTrue((new DateTime.fromMillisecondsSinceEpoch(t1, isUtc: true))
    .isAfter(new DateTime.fromMillisecondsSinceEpoch(t2, isUtc: false)));
}

checkFalse(t1, t2) {
  Expect.isFalse((new DateTime.fromMillisecondsSinceEpoch(t1, isUtc: true))
    .isAfter(new DateTime.fromMillisecondsSinceEpoch(t2, isUtc: true)));

  Expect.isFalse((new DateTime.fromMillisecondsSinceEpoch(t1, isUtc: false))
    .isAfter(new DateTime.fromMillisecondsSinceEpoch(t2, isUtc: true)));

  Expect.isFalse((new DateTime.fromMillisecondsSinceEpoch(t1, isUtc: false))
    .isAfter(new DateTime.fromMillisecondsSinceEpoch(t2, isUtc: false)));
}

main() {
  checkFalse(0, 0);
  checkFalse(1, 1);
  checkFalse(6031769, 6031769);
  checkFalse(603176900, 603176900);
  checkFalse(603176900009, 603176900009);
  checkFalse(0, 1);
  checkFalse(603176900008, 603176900009);
  checkFalse(100, 603176900009);
  checkFalse(-100, 100);

  checkTrue(1, 0);
  checkTrue(603176900009, 603176900008);
  checkTrue(603176900009, 100);
  checkTrue(100, -100);
}
