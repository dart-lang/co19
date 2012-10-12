/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if this occurs at the same time or before other.
 * The comparison is independent of whether the time is utc or in the local time zone.
 * @description Checks that true is returned only if this occurs at the same time or before the argument.
 * @author iefremov
 */

check(expected, actual) {
  Expect.isTrue(new Date.fromMillisecondsSinceEpoch(expected, isUtc: true) <=
    new Date.fromMillisecondsSinceEpoch(actual, isUtc: true));

  Expect.isTrue(new Date.fromMillisecondsSinceEpoch(expected, isUtc: false) <=
    new Date.fromMillisecondsSinceEpoch(actual, isUtc: true));

  Expect.isTrue(new Date.fromMillisecondsSinceEpoch(expected, isUtc: true) <=
    new Date.fromMillisecondsSinceEpoch(actual, isUtc: false));
}

checkFalse(expected, actual) {
  Expect.isFalse(new Date.fromMillisecondsSinceEpoch(expected, isUtc: true) <=
    new Date.fromMillisecondsSinceEpoch(actual, isUtc: true));

  Expect.isFalse(new Date.fromMillisecondsSinceEpoch(expected, isUtc: false) <=
    new Date.fromMillisecondsSinceEpoch(actual, isUtc: true));

  Expect.isFalse(new Date.fromMillisecondsSinceEpoch(expected, isUtc: true) <=
    new Date.fromMillisecondsSinceEpoch(actual, isUtc: false));
}

main() {
  check(0, 1);
  check(603176900008, 603176900009);
  check(100, 603176900009);
  check(-100, 100);
  check(0, 0);
  check(1, 1);
  check(6031769, 6031769);
  check(603176900, 603176900);
  check(603176900009, 603176900009);

  checkFalse(1, 0);
  checkFalse(603176900009, 603176900008);
  checkFalse(603176900009, 100);
  checkFalse(100, -100);
}
