/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the absolute value is greater than or equal to (2^53 - 0.5)*2^971
 * (the maximal double plus half the distance to its lower neighbor)
 * then the conversion yields +/-infinity.
 * @description Direct assertion checks.
 * @author pagolubev
 * @reviewer akuznecov
 */


void main() {
  Rational x = Math.pow(2, 971) * (Math.pow(2, 53) - 1/2);
  Expect.isTrue(x.toDouble() == double.INFINITY);
  Expect.isTrue((x*2).toDouble() == double.INFINITY);
}
