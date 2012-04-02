/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A literal number (10.3) is a constant expression.
 * @description Checks that various literal numbers can be elements of a constant list literal
 * and are, therefore, constant expressions. Minus sign is not a part of a number literal so those
 * are not included in this test.
 * @author iefremov
 * @reviewer rodionov
 */

final constList = const [
  0,
  1,
  2147483647,
  +.2147483648E10,
  .9223372036854775807,
  9223372036854775808E-100,
  +9223372036854775808e0,
  9223372036854775809e+9223372036854775809,
  92233720368547758080.9223372036854775808e-00124155125325235,
  92233720368547758080.9223372036854775808e+92233720368547758080,
  92233720368547758080.9223372036854775808E-92233720368547758080,
  0xFF,
  0xFfFfFfFf,
  0xFFffFFffFFffFFff,
  0xffffFFffffFFffffFFffffFFffffFFff
];

main() {
  Expect.isTrue(constList is List);
}
