/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the absolute value of the rational is less than or equal to 2^-1075
 * (half of the smallest non-zero double) then the result of conversion to double is +/-0.0d.
 * @description Direct assertion checks.
 * @author pagolubev
 * @reviewer akuznecov
 * @needsreview Are rationals still supported?
 */


void main() {
  Rational x = Math.pow(2, -1075);
  double y = x.toDouble();
  Expect.isTrue(y == 0.0d);
  Expect.isTrue(y / 2 == 0.0d);
}
