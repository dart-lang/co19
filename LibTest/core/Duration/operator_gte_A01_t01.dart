/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator <=(Duration other) 
 * @description Checks that duration calculation is correct
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

int expected(int d, int h, int m, int s, int ms) {
  return d * 24 * 3600000 + h * 3600000 + m * 60000 + s * 1000 + ms;
}

void check(int d1, int h1, int m1, int s1, int ms1, int d2, int h2, int m2,
    int s2, int ms2) {
  Expect.equals(
      expected(d1, h1, m1, s1, ms1) >= expected(d2, h2, m2, s2, ms2),
      new Duration(
              days: d1,
              hours: h1,
              minutes: m1,
              seconds: s1,
              milliseconds: ms1) >=
          new Duration(
              days: d2,
              hours: h2,
              minutes: m2,
              seconds: s2,
              milliseconds: ms2));
}

void checkEq(int d, int h, int m, int s, int ms) {
  check(d, h, m, s, ms, d, h, m, s, ms);
}

int seed = 1234567;
int nextRand() {
  seed = 0x3fffffff & ((seed >> 17) + seed * 199933  + 11);
  return (seed >> 5) & 127;
}

main() {
  for (int k = 0; k < 100; k++) {
    check(nextRand(), nextRand(), nextRand(), nextRand(), nextRand(),
        nextRand(), nextRand(), nextRand(), nextRand(), nextRand());
    checkEq(nextRand(), nextRand(), nextRand(), nextRand(), nextRand());
  }
}
