/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructs a Date instance based on the individual parts.
 * The date is in the local time zone.
 * @description Checks that Date constructor handles under- and overflow correctly.
 * @author rodionov
 */

main() {
  Expect.equals(new Date(1, 0, 1, 0, 0, 0, 0), new Date(0, 12, 1, 0, 0, 0, 0));
  Expect.equals(new Date(1, 13, 1, 0, 0, 0, 0), new Date(2, 1, 1, 0, 0, 0, 0));
  Expect.equals(new Date(1, 1, 0, 0, 0, 0, 0), new Date(0, 12, 31, 0, 0, 0, 0));
  Expect.equals(new Date(1, 1, -1, 0, 0, 0, 0), new Date(0, 12, 30, 0, 0, 0, 0));
  Expect.equals(new Date(2012, 2, 30, 0, 0, 0, 0), new Date(2012, 3, 1, 0, 0, 0, 0));
  Expect.equals(new Date(2011, 2, 30, 0, 0, 0, 0), new Date(2011, 3, 2, 0, 0, 0, 0));
  Expect.equals(new Date(1, 1, 1, -1, 0, 0, 0), new Date(0, 12, 31, 23, 0, 0, 0));
  Expect.equals(new Date(1, 1, 1, 24, 0, 0, 0), new Date(1, 1, 2, 0, 0, 0, 0));
  Expect.equals(new Date(1, 1, 1, 0, -1, 0, 0), new Date(0, 12, 31, 23, 59, 0, 0));
  Expect.equals(new Date(1, 1, 1, 0, 60, 0, 0), new Date(1, 1, 1, 1, 0, 0, 0));
  Expect.equals(new Date(1, 1, 1, 0, 0, -1, 0), new Date(0, 12, 31, 23, 59, 59, 0));
  Expect.equals(new Date(1, 1, 1, 0, 0, 60, 0), new Date(1, 1, 1, 0, 1, 0, 0));
  Expect.equals(new Date(1, 1, 1, 0, 0, 0, -1), new Date(0, 12, 31, 23, 59, 59, 999));
  Expect.equals(new Date(1, 1, 1, 0, 0, 0, 1000), new Date(1, 1, 1, 0, 0, 1, 0));
  Expect.equals(new Date(2012, 2, 29, 23, 59, 59, 1000), new Date(2012, 3, 1, 0, 0, 0, 0));
}
