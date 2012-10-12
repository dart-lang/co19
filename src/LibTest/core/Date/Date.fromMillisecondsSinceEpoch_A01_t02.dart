/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructs a new Date instance with the given millisecondsSinceEpoch.
 * If isUtc is false then the date is in the local time zone.
 * The constructed Date represents 1970-01-01T00:00:00Z + millisecondsSinceEpoch ms
 * in the given time zone (local or UTC).
 * @description Checks that If isUtc is false then the date is in the local time zone.
 * @author iefremov
 */


main() {
  Date d = new Date.fromMillisecondsSinceEpoch(1, isUtc: true);
  Expect.identical(d, d.toUtc());

  d = new Date.fromMillisecondsSinceEpoch(1, isUtc: false);
  Expect.identical(d, d.toLocal());

  d = new Date.fromMillisecondsSinceEpoch(1);
  Expect.identical(d, d.toLocal());
}
