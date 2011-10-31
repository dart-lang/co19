/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.fromEpoch(int value, TimeZone timeZone) constructs a new [Date] instance
 * with the given time zone. The given [timeZone] must not be [:null:].
 * @description Checks that Date.fromEpoch constructs Date instance in the correct time zone
 * @author hlodvig
 * @reviewer msyabro
 */

main() {
  Expect.equals(new TimeZone.utc(), new Date.fromEpoch(0, new TimeZone.utc()).timeZone);
  Expect.equals(new TimeZone.local(), new Date.fromEpoch(0, new TimeZone.local()).timeZone);

  Expect.equals(new TimeZone.utc(), new Date.fromEpoch(new Date.now().value, new TimeZone.utc()).timeZone);
  Expect.equals(new TimeZone.local(), new Date.fromEpoch(new Date.now().value, new TimeZone.local()).timeZone);
}
