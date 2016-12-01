/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Duration({int days: 0, int hours: 0, int minutes: 0,
 * int seconds: 0, int milliseconds: 0, int microseconds: 0})
 * The duration is the sum of all individual parts.
 * This means that individual parts don't need to be less than the next-bigger
 * unit.
 * For example hours is allowed to have a value greater than 23.
 * @description Checks that a Duration instance can be created without error
 * using various non-negative integer arguments.
 * @author akuznecov, sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  check(0, 0, 0, 0, 0, 0);
  check(1, 1, 1, 1, 1, 1);
  check(30, 10, 20, 45, 700, 666);
  check(0x7fffffff, 0, 0x7fffffff, 0, 0x7fffffff, 0x7fffffff);
  check(0, 0x80000000, 0, 0x80000000, 0, 0x80000000);
  check(0x7fffffffffffffff, 0, 0x7fffffffffffffff, 0, 0x7fffffffffffffff,
      0x7fffffffffffffff);
  check(0, 0x8000000000000000, 0, 0x8000000000000000, 0, 0);
}

void check(int d, int h, int m, int s, int ms, int mc) {
  Duration dur = new Duration(days: d, hours: h, minutes: m, seconds: s,
      milliseconds: ms, microseconds: mc);
  int sum = mc + (ms + (s + ((m + (h + d * 24) * 60) * 60)) * 1000) * 1000;
  Expect.equals(sum, dur.inMicroseconds);
}
