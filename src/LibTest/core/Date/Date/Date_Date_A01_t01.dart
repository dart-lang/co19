/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date(int year, int month, int day, int hours, int minutes, int
 *            seconds, int milliseconds) constructs a [Date] instance based
 *            on the individual parts
 * @description Normal int values passed as arguments.
 * @author hlodvig
 * @reviewer iefremov
 */

main() {
  Date dt = new Date(2001, 1, 2, 3, 4, 5, 6);
  Expect.equals(2001, dt.year);
  Expect.equals(1, dt.month);
  Expect.equals(2, dt.day);
  Expect.equals(3, dt.hours);
  Expect.equals(4, dt.minutes);
  Expect.equals(5, dt.seconds);
  Expect.equals(6, dt.milliseconds);
  Expect.isTrue(dt is Date);
}
  