/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Duration operator *(num factor)
 * Multiplies this Duration by the given factor and returns the result as a new Duration.
 * Note that when factor is a double, and the duration is greater than 53 bits,
 * precision is lost because of double-precision arithmetic.
 * @description Checks that duration calculation is correct
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

void check(int d, int h, int m, int s, int ms, num f) {
  Expect.equals(
      (d * f) * 24 * 3600000 +
          (h * f) * 3600000 +
          (m * f) * 60000 +
          (s * f) * 1000 +
          ms * f,
      (new Duration(
                  days: d, hours: h, minutes: m, seconds: s, milliseconds: ms) *
              f)
          .inMilliseconds);
}

int seed = 1234567;
int nextRand() {
  seed = 0x3fffffff & ((seed >> 17) + seed * 199933  + 11);
  return (seed >> 5) & 127;
}

main() {
  for (int k = 0; k < 100; k++) {
    check(
        nextRand(), nextRand(), nextRand(), nextRand(), nextRand(), nextRand());
  }
}
