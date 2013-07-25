/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int day
 * Returns the day into the month 1..31.
 * @description Creates a new DateTime with various integer day values (1..31)
 * and reads the value back.
 * @author rodionov
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";


main() {
  check(1);
  check(10);
  check(31);
}

void check(int d) {
  DateTime date = new DateTime(2011, 8, d, 0, 0, 0, 0);
  Expect.isTrue(date.day is int);
  Expect.equals(d, date.day);
}
