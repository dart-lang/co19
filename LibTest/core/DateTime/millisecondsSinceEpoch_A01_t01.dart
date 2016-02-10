/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int millisecondsSinceEpoch
 * The milliseconds since 1970-01-01T00:00:00Z (UTC).
 * This value is independent of the time zone.
 * @description Checks that the getter returns correct values.
 * @author iefremov
 */
import "../../../Utils/expect.dart";

check(millis) {
  Expect.equals(millis, new DateTime.fromMillisecondsSinceEpoch(millis,
      isUtc: true).millisecondsSinceEpoch);
  Expect.equals(millis, new DateTime.fromMillisecondsSinceEpoch(millis,
      isUtc: false).millisecondsSinceEpoch);
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
