/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.fromString(String formattedString) constructs a new [Date] instance
 * based on [formattedString]
 * @description Checks that [timeZone] is set according to ISO 8601 standard. If time
 * ends with 'Z' timezone is set to UTC, else timezone is set to local.
 * @author hlodvig
 * @reviewer msyabro
 */

main(){
  Expect.equals(new TimeZone.local(), new Date.fromString('2000-01-01 00:00:00').timeZone);
  Expect.equals(new TimeZone.utc(), new Date.fromString('2000-01-01 00:00:00Z').timeZone);
}
