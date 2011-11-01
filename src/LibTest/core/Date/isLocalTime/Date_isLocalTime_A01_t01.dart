/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isLocalTime() returns true if this [Date] is set to local time. 
 * @description check that returned value is correct
 * @author hlodvig
 * @reviewer msyabro
 */

main() {
  Expect.isTrue(new Date.fromEpoch(1, new TimeZone.local()).isLocalTime());
  Expect.isFalse(new Date.fromEpoch(1, new TimeZone.utc()).isLocalTime());
}
