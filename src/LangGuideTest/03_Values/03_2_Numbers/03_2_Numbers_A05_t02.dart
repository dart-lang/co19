/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion When converting a rational to a floating-point number the conversion picks
 * the closest double to the rational. If two doubles are at equal distance then the double
 * with an even significand is chosen.
 * @description Checks conversion of rationals that are in the middle of adjacent doubles.
 * @author pagolubev
 * @reviewer akuznecov
 * @needsreview Are rationals still supported?
 */


void main() {
  Expect.isTrue(1.0000000000000003.toDouble() == 1.0000000000000004d);
  Expect.isTrue(1.0000000000000001.toDouble() == 1d);
  Expect.isTrue(4503599627370496.5.toDouble() == 4503599627370496d);
}
