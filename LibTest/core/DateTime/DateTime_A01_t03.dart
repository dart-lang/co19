/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory DateTime(int year, [int month = 1, int day = 1, int hour = 0,
 * int minute = 0, int second = 0, int millisecond = 0])
 * Constructs a DateTime instance based on the individual parts.
 * The date is in the local time zone. month and day are one-based. 
 * @description Checks that DateTime constructor handles under- and overflow correctly.
 * @author rodionov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(new DateTime(1, 0, 1, 0, 0, 0, 0), new DateTime(0, 12, 1, 0, 0, 0, 0));
  Expect.equals(new DateTime(1, 13, 1, 0, 0, 0, 0), new DateTime(2, 1, 1, 0, 0, 0, 0));
  Expect.equals(new DateTime(1, 1, 0, 0, 0, 0, 0), new DateTime(0, 12, 31, 0, 0, 0, 0));
  Expect.equals(new DateTime(1, 1, -1, 0, 0, 0, 0), new DateTime(0, 12, 30, 0, 0, 0, 0));
  Expect.equals(new DateTime(2012, 2, 30, 0, 0, 0, 0), new DateTime(2012, 3, 1, 0, 0, 0, 0));
  Expect.equals(new DateTime(2011, 2, 30, 0, 0, 0, 0), new DateTime(2011, 3, 2, 0, 0, 0, 0));
  Expect.equals(new DateTime(1, 1, 1, -1, 0, 0, 0), new DateTime(0, 12, 31, 23, 0, 0, 0));
  Expect.equals(new DateTime(1, 1, 1, 24, 0, 0, 0), new DateTime(1, 1, 2, 0, 0, 0, 0));
  Expect.equals(new DateTime(1, 1, 1, 0, -1, 0, 0), new DateTime(0, 12, 31, 23, 59, 0, 0));
  Expect.equals(new DateTime(1, 1, 1, 0, 60, 0, 0), new DateTime(1, 1, 1, 1, 0, 0, 0));
  Expect.equals(new DateTime(1, 1, 1, 0, 0, -1, 0), new DateTime(0, 12, 31, 23, 59, 59, 0));
  Expect.equals(new DateTime(1, 1, 1, 0, 0, 60, 0), new DateTime(1, 1, 1, 0, 1, 0, 0));
  Expect.equals(new DateTime(1, 1, 1, 0, 0, 0, -1), new DateTime(0, 12, 31, 23, 59, 59, 999));
  Expect.equals(new DateTime(1, 1, 1, 0, 0, 0, 1000), new DateTime(1, 1, 1, 0, 0, 1, 0));
  Expect.equals(new DateTime(2012, 2, 29, 23, 59, 59, 1000), new DateTime(2012, 3, 1, 0, 0, 0, 0));
}
