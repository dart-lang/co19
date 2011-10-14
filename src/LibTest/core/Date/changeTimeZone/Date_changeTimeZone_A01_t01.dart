/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date changeTimeZone(TimeZone targetTimeZone) returns [Date].
 * @description Checks that changeTimeZone method returns Date instance
 * @author hlodvig
 */

main() {
  Expect.isTrue(new Date(2001, 8, 18, 0, 0, 0, 0).changeTimeZone(new TimeZone.utc()) is Date);
  Expect.isTrue(new Date(2001, 8, 18, 0, 0, 0, 0).changeTimeZone(new TimeZone.local()) is Date);
  Expect.isTrue(new Date(2001, 8, 18, 0, 0, 0, 0).changeTimeZone(new TimeZone(new Time(0, 3, 0, 0, 0))) is Date);
}
