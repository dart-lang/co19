/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertionbool bool isAtSameMomentAs(DateTime other)
 * Returns true if this occurs at the same moment as other.
 * The comparison is independent of whether the time is in UTC or in the local time zone.
 * @description Checks that true is returned only if this occurs at the same time as the argument.
 * @author kaigorodov
 */

import "../../../Utils/expect.dart";

checkTrue(t1, t2) {
  Expect.isTrue((new DateTime.fromMillisecondsSinceEpoch(t1, isUtc: true))
    .isAtSameMomentAs(new DateTime.fromMillisecondsSinceEpoch(t2, isUtc: true)));

  Expect.isTrue((new DateTime.fromMillisecondsSinceEpoch(t1, isUtc: false))
    .isAtSameMomentAs(new DateTime.fromMillisecondsSinceEpoch(t2, isUtc: true)));

  Expect.isTrue((new DateTime.fromMillisecondsSinceEpoch(t1, isUtc: true))
    .isAtSameMomentAs(new DateTime.fromMillisecondsSinceEpoch(t2, isUtc: false)));
}

checkFalse(t1, t2) {
  Expect.isFalse((new DateTime.fromMillisecondsSinceEpoch(t1, isUtc: true))
    .isAtSameMomentAs(new DateTime.fromMillisecondsSinceEpoch(t2, isUtc: true)));

  Expect.isFalse((new DateTime.fromMillisecondsSinceEpoch(t1, isUtc: false))
    .isAtSameMomentAs(new DateTime.fromMillisecondsSinceEpoch(t2, isUtc: true)));

  Expect.isFalse((new DateTime.fromMillisecondsSinceEpoch(t1, isUtc: false))
    .isAtSameMomentAs(new DateTime.fromMillisecondsSinceEpoch(t2, isUtc: false)));
}

main() {
  checkTrue(0, 0);
  checkTrue(1, 1);
  checkTrue(6031769, 6031769);
  checkTrue(603176900, 603176900);
  checkTrue(603176900009, 603176900009);
  
  checkFalse(1, 0);
  checkFalse(603176900009, 603176900008);
  checkFalse(603176900009, 100);
  checkFalse(100, -100);
}
