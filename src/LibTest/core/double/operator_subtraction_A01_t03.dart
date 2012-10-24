/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator -(num other)
 * @description Checks that if both operands are positive infinity or both
 * operands are negative infinity the result is NaN.
 * @author pagolubev
 * @reviewer msyabro
 */


final double positive_infinity = 1 / 0;
final double negative_infinity = -1 / 0;

checkNaN(d) {
  var msg = 'expected: NaN, actual: $d';
  Expect.isTrue(d.isNaN, msg);
}


main() {
  checkNaN(positive_infinity - positive_infinity);
  checkNaN(negative_infinity - negative_infinity);
}
