/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Duration({int days: 0, int hours: 0, int minutes: 0,
 * int seconds: 0, int milliseconds: 0, int microseconds: 0})
 * All individual parts are allowed to be negative.
 * @description Checks that negative values are allowed and do not cause any
 * errors
 * @author akuznecov, sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  check(-1, -1, -1, -1, -1, -1);
  check(30, -10, 20, -45, -700, -777);
  check(-0x80000000, 0, -0x80000000, 0, -0x80000000, -0x80000000);
  check(0, -0x80000001, 0, -0x80000001, 0, -0x80000001);
  check(-0x800000000000000, 0, -0x800000000000000, 0, -0x800000000000000,
      -0x800000000000000);
  check(0, -0x800000000000001, 0, -0x800000000000001, 0, 1);
}

void check(int d, int h, int m, int s, int ms, int mc) {
  Duration dur = new Duration(days: d, hours: h, minutes: m, seconds: s,
      milliseconds: ms, microseconds: mc);
  int sum = mc + (ms + (s + ((m + (h + d * 24) * 60) * 60)) * 1000) * 1000;
  Expect.equals(sum, dur.inMicroseconds);
}
