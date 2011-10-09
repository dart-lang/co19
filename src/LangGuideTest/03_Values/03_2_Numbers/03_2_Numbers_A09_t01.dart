/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion As for arithmetic operations rationals are first converted to doubles
 * when they are compared to doubles.
 * @description Some rational to double comparison checks.
 * @author pagolubev
 * @reviewer akuznecov
 * @needsreview Are rationals still supported?
 */


void main() {
  Expect.isTrue(1.0d == 1);
  Expect.isTrue(0 == 0.0d);
  Expect.isTrue(1e1000 == double.INFINITY);
  Expect.isTrue(0.09999999999999 == 0.1d);
  Expect.isTrue(0.1 == 0.1d);
  Expect.isTrue(1e-500 == 0d);
}
