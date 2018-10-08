/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns this [Duration] in minutes. 
 * @description Checks that duration calculation is correct
 * @author rodionov
 */
import "../../../Utils/expect.dart";

main() {
  check(0, 0, 0, 0, 0, 0);
  check(0, 0, 0, 0, 1, 1);
  check(0, 0, 0, 0, -1, 1);
  check(1, 1, 1, 1, 1, 1);
  check(-1, -1, -1, -1, -1, -1);
  check(9223372036854775807, 9223372036854775807, 9223372036854775807,
      9223372036854775807, 9223372036854775807, 9223372036854775807);
  check(-9223372036854775807, -9223372036854775807, -9223372036854775807,
      -9223372036854775807, -9223372036854775807, -9223372036854775807);
}

void check(int d, int h, int m, int s, int ms, int mc) {
  Expect.equals(
      (mc + (ms + (s + ((m + (h + d * 24) * 60) * 60)) * 1000) * 1000) ~/
          (24 * 60 * 60 * 1000 * 1000),
      new Duration(days: d, hours: h, minutes: m, seconds: s, milliseconds: ms,
          microseconds: mc).inDays);
}
