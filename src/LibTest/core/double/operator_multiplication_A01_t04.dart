/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator *(num other)
 * @description Checks that if both operands are infinite the result is infinity.
 * @author pagolubev
 * @reviewer msyabro
 */


final double positive_infinity = 1 / 0;
final double negative_infinity = -1 / 0;

main() {
  Expect.equals(positive_infinity, positive_infinity * positive_infinity);
  Expect.equals(positive_infinity, negative_infinity * negative_infinity);

  Expect.equals(negative_infinity, positive_infinity * negative_infinity);
  Expect.equals(negative_infinity, negative_infinity * positive_infinity);
}
