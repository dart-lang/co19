/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime toUtc()
 * Returns this in UTC.
 * Returns itself if it is already in UTC.
 * Otherwise, this method is equivalent to
 *   new DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch, isUtc: true)
 * @description Checks that the method returns the correct value.
 * @author iefremov
 */
import "../../../Utils/expect.dart";

check(millis) {
  DateTime d = new DateTime.fromMillisecondsSinceEpoch(millis, isUtc: false);
  Expect.equals(d.toUtc(), new DateTime.fromMillisecondsSinceEpoch(d.millisecondsSinceEpoch, isUtc: true));
}

main() {
  DateTime d = new DateTime.fromMillisecondsSinceEpoch(100500, isUtc: true);
  Expect.identical(d, d.toUtc());

  check(0);
  check(-1);
  check(6031769);
  check(8640000000000000);
  check(-6031769);
  check(-8640000000000000);
}

