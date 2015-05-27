/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime toLocal()
 * Returns this in the local time zone.
 * Returns itself if it is already in the local time zone.
 * Otherwise, this method is equivalent to
 * new DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch, isUtc: false).
 * @description Checks that the method returns the correct value.
 * @author iefremov
 */
import "../../../Utils/expect.dart";

check(millis) {
  DateTime d = new DateTime.fromMillisecondsSinceEpoch(millis, isUtc: true);
  Expect.equals(d.toLocal(), new DateTime.fromMillisecondsSinceEpoch(d.millisecondsSinceEpoch, isUtc: false));
}

main() {
  DateTime d = new DateTime.now();
  Expect.identical(d, d.toLocal());

  check(0);
  check(-1);
  check(6031769);
  check(8640000000000000);
  check(-6031769);
  check(-8640000000000000);
}

