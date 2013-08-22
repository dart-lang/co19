/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int year
 * Returns the year.
 * @description Creates a new DateTime with various integer year values (less than
 * 10^8 days, as specified in the DateTime class description), and reads the value back.
 * @author rodionov
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  check(0);
  check(-1);
  check(1991);
  check(-1991);
  check(275760);
}

void check(int y) {
  DateTime date = new DateTime.utc(y, 8, 18, 0, 0, 0, 0);
  Expect.isTrue(date.year is int);
  Expect.equals(y, date.year);
}
