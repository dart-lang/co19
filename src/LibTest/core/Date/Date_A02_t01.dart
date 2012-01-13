/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date(int year, int month, int day, int hours, int minutes, int seconds, int milliseconds)
 * constructs a [Date] in local timezone
 * @description Checks that the default timezone is local one.
 * @author hlodvig
 * @reviewer iefremov
 * @reviewer msyabro
 */

main() {
  Date dt = new Date(2001, 1, 2, 3, 4, 5, 6);
  Expect.equals(new TimeZone.local(), dt.timeZone);
}
