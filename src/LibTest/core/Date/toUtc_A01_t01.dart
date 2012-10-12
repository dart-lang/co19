/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns this in UTC. Returns itself if it is already in UTC.
 * Otherwise, this method is equivalent to
 * new Date.fromMillisecondsSinceEpoch(millisecondsSinceEpoch, isUtc: true).
 * @description Checks that the method returns the correct value.
 * @author iefremov
 */

check(millis) {
  Date d = new Date.fromMillisecondsSinceEpoch(millis, isUtc: false);
  Expect.equals(d.toUtc(), new Date.fromMillisecondsSinceEpoch(d.millisecondsSinceEpoch, isUtc: true));
}

main() {
  Date d = new Date.fromMillisecondsSinceEpoch(100500, isUtc: true);
  Expect.identical(d, d.toUtc());

  check(0);
  check(-1);
  check(6031769);
  check(8640000000000000);
  check(-6031769);
  check(-8640000000000000);
}

