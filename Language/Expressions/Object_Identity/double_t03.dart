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
 * @description Checks identity if positive and negative zero double instances.
 * @author ngl2unipro.ru
 */
import "../../../Utils/expect.dart";

div(var a, var b) {
  return a / b;
}

mul(var a, var b) {
  return a * b;
}

double pnil = 0.0;
double nnil = -0.0;

main() {
  double pnil1 = div(0.0, 2);
  double pnil2 = div(-0.0, -2);
  double nnil1 = div(0.0, -2);
  double nnil2 = div(-0.0, 2);
  Expect.isTrue(identical(pnil, 0.0));
  Expect.isTrue(identical(pnil, pnil1));
  Expect.isTrue(identical(pnil, pnil2));
  Expect.isTrue(identical(mul(pnil, 2), pnil));
  Expect.isTrue(identical(mul(nnil, -2), pnil));
  Expect.isTrue(identical(nnil, -0.0));
  Expect.isTrue(identical(nnil, nnil1));
  Expect.isTrue(identical(nnil, nnil2));
  Expect.isTrue(identical(mul(pnil, -2), nnil));
  Expect.isTrue(identical(mul(nnil, 2), nnil));

  Expect.isFalse(identical(pnil, nnil));
  Expect.isFalse(identical(pnil1, nnil1));
  Expect.isFalse(identical(pnil2, nnil2));
}
