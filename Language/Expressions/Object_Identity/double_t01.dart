/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The predeﬁned Dart function identical() is deﬁned such that
 * identical(c1, c2) iff:
 * . . .
 *  • c1 and c2 are instances of double and one of the following holds:
 *      – c1 and c2 are non-zero and c1 == c2.
 *      – Both c1 and c2 are +0.0.
 *      – Both c1 and c2 are −0.0.
 *      – Both c1 and c2 represent a NaN value with the same underlying bit
 *        pattern.
 * @description Checks that two non-zero and non-NaN doubles representing the
 * same value are identical.
 * @author kaigorodov
 * @reviewer rodionov
 * @needsreview issue 7024
 */
import "../../../Utils/expect.dart";

mul(var d1, var d2) {
  return d1 * d2;
}

main() {
  var d1 = 32000.5;
  var d2 = 33000.5;
  Expect.isTrue(identical(d1, d1));
  Expect.isTrue(identical(2.5, 2.5));
  Expect.isTrue(identical(2.5, 2.5-0.0));
  Expect.isTrue(identical(2.5, 5.0/2));
  Expect.isTrue(identical(1.5*2, 1.5*2));
  Expect.isTrue(identical(mul(d1, d2), mul(d1, d2)));
  Expect.isTrue(identical(mul(d1, d2), mul(d2, d1)));
}
