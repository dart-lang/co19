/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.withTimeZone(int year, int month, int day, int hours, int minutes, int seconds, int milliseconds, TimeZone timeZone)
 *  constructs a [Date] instance based on the individual parts
 * @description Checks that the Date instance is created.
 * @author hlodvig
 * @reviewer msyabro
 */

main(){
  Expect.isTrue(new Date.withTimeZone(2001, 1, 2, 3, 4, 5, 6, new TimeZone.utc()) is Date);
  Expect.isTrue(new Date.withTimeZone(2001, 1, 2, 3, 4, 5, 6, new TimeZone.local()) is Date);
}
