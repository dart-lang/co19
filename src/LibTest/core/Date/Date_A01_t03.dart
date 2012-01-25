/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date(int year, int month, int day, int hours, int minutes, int
 *            seconds, int milliseconds) constructs a [Date] instance based
 *            on the individual parts
 * @description Checks that creating Date with incorrect parameters results in IllegalArgumentException
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview unspecified exception.
 */

check(int val) {
  try {
    new Date(1, val, 1, 1, 1, 1, 1);
    Expect.fail("IllegalArgumentException is expected");
  } catch(IllegalArgumentException e) {}

  try {
    new Date(1, 1, val, 1, 1, 1, 1);
    Expect.fail("IllegalArgumentException is expected");
  } catch(IllegalArgumentException e) {}

  try {
    new Date(1, 1, 1, val, 1, 1, 1);
    Expect.fail("IllegalArgumentException is expected");
  } catch(IllegalArgumentException e) {}

  try {
    new Date(1, 1, 1, 1, val, 1, 1);
    Expect.fail("IllegalArgumentException is expected");
  } catch(IllegalArgumentException e) {}

  try {
    new Date(1, 1, 1, 1, 1, val, 1);
    Expect.fail("IllegalArgumentException is expected");
  } catch(IllegalArgumentException e) {}

  try {
    new Date(1, 1, 1, 1, 1, 1, val);
    Expect.fail("IllegalArgumentException is expected");
  } catch(IllegalArgumentException e) {}
}

checkSpecialDate([int year = 1, int month = 1, int day = 1, int hours = 0,
    int minutes = 0, int seconds = 0, int milliseconds = 0]) {
  try {
    new Date(year, month, day, hours, minutes, seconds, milliseconds);
    Expect.fail("IllegalArgumentException is expected");
  } catch(IllegalArgumentException e) {}
}

main() {
  check(-1);
  check(-1991);
  check(0x7fffffff);
  check(0x7fffffffffffffff);
  check(0x8000000000000000);
  check(-0x80000000);
  check(-0x8000000000000000);
  check(-0x8000000000000001);

  checkSpecialDate(month: 0);
  checkSpecialDate(day: 0);
  checkSpecialDate(month: 13);
  checkSpecialDate(day: 32);
  checkSpecialDate(hours: 25);
  checkSpecialDate(minutes: 60);
  checkSpecialDate(seconds: 60);
  checkSpecialDate(milliseconds: 1000);
}
