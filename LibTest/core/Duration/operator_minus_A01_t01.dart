/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Duration operator -(Duration other)
 * Returns the difference of this Duration and other as a new Duration.
 * @description Checks that duration calculation is correct
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

void check(int d1, int h1, int m1, int s1, int ms1, int d2, int h2, int m2,
    int s2, int ms2) {
  Expect.equals(
      (d1 - d2) * 24 * 3600000 +
          (h1 - h2) * 3600000 +
          (m1 - m2) * 60000 +
          (s1 - s2) * 1000 +
          ms1 -
          ms2,
      (new Duration(
                  days: d1,
                  hours: h1,
                  minutes: m1,
                  seconds: s1,
                  milliseconds: ms1) -
              new Duration(
                  days: d2,
                  hours: h2,
                  minutes: m2,
                  seconds: s2,
                  milliseconds: ms2))
          .inMilliseconds);
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
  }
}
