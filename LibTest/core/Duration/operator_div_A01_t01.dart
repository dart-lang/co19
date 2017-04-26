/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Duration operator ~/(int quotient)
 * Divides this Duration by the given quotient and returns the truncated result
 * as a new Duration.
 * @description Checks that duration calculation is correct
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

void check(int d, int h, int m, int s, int ms, num q) {
  Expect.equals(
      (d * 24 * 3600000 + h * 3600000 + m * 60000 + s * 1000 + ms) ~/ q,
      (new Duration(days: d, hours: h, minutes: m, seconds: s, milliseconds: ms)
          ~/ q).inMilliseconds);
}

int seed = 1234567;
int nextRand() {
  seed = 0x3fffffff & ((seed >> 17) + seed * 199933  + 11);
  return (seed >> 5) & 127;
}

main() {
  for (int k = 0; k < 100; k++) {
    check(nextRand(), nextRand(), nextRand(), nextRand(), nextRand(),
        nextRand() + 1);
  }
}
