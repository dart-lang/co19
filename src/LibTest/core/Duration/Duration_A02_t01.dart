/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All individual parts are allowed to be negative.
 * @description Checks that negative values are allowed and do not cause any errors
 * @author akuznecov
 * @reviewer rodionov
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  check(-1, -1, -1, -1, -1);
  check(30, -10, 20, -45, -700);
  check(-0x80000000, 0, -0x80000000, 0, -0x80000000);
  check(0, -0x80000001, 0, -0x80000001, 0);
  check(-0x8000000000000000, 0, -0x8000000000000000, 0, -0x8000000000000000);
  check(0, -0x8000000000000001, 0, -0x8000000000000001, 0);
}

void check(int d, int h, int m, int s, int ms) {
  Expect.isTrue(new Duration(days: d, hours: h, minutes: m, seconds: s, milliseconds: ms) is Duration);
}
