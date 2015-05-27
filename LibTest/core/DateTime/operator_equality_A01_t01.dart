/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * Returns true if other is a DateTime at the same moment and in the same timezone (UTC or local).
 * @description Checks that true is returned only if this occurs at the same time
 * as an argument.
 * @author iefremov
 */
import "../../../Utils/expect.dart";

check(expected, actual) {
  Expect.isTrue(new DateTime.fromMillisecondsSinceEpoch(expected, isUtc: true) ==
    new DateTime.fromMillisecondsSinceEpoch(actual, isUtc: true));

  Expect.isTrue(new DateTime.fromMillisecondsSinceEpoch(expected, isUtc: false) ==
    new DateTime.fromMillisecondsSinceEpoch(actual, isUtc: false));
}

checkFalse(expected, actual) {
  Expect.isFalse(new DateTime.fromMillisecondsSinceEpoch(expected, isUtc: true) ==
    new DateTime.fromMillisecondsSinceEpoch(actual, isUtc: true));

  Expect.isFalse(new DateTime.fromMillisecondsSinceEpoch(expected, isUtc: false) ==
    new DateTime.fromMillisecondsSinceEpoch(actual, isUtc: false));
}

main() {
  check(0, 0);
  check(1, 1);
  check(6031769, 6031769);
  check(603176900, 603176900);
  check(603176900009, 603176900009);

  checkFalse(0, 1);
  checkFalse(1, 0);
  checkFalse(603176900008, 603176900009);
  checkFalse(603176900009, 603176900008);
  checkFalse(100, 603176900009);
  checkFalse(603176900009, 100);
  checkFalse(100, -100);
}
