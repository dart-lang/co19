/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion When comparing a double d to a rational r then the rational is 
 * first converted into a double.
 * @description Test equality operator for rational to double comparsion
 * @author akuznecov
 * @needsreview Are rationals still supported?
 */


void main() {
  // 0.3 == 0.3d // => true
  Expect.equals(new Rational(0.3), 0.3);
  Expect.equals(0.3, new Rational(0.3));
}
