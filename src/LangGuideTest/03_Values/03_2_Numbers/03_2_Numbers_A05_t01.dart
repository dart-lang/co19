/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion When converting a rational to a floating-point number the conversion picks
 * the closest double to the rational. If two doubles are at equal distance then the double
 * with an even significand is chosen.
 * @description Checks that a rational to double conversion picks the closest double.
 * @author pagolubev
 * @reviewer akuznecov
 * @needsreview Are rationals still supported?
 */


void main() {
  Expect.isTrue(0.1.toDouble() == 0.1d);
  Expect.isTrue(4503599627370496.3.toDouble() == 4503599627370496d);
  Expect.isTrue(4503599627370496.7.toDouble() == 4503599627370497d);
}
