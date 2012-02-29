/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A literal number (10.3) is a constant expression.
 * @description Checks that various literal numbers can be assigned to a static final variable
 * and are, therefore, constant expressions. Minus sign is not a part of a number literal so those
 * are not included in this test.
 * @author iefremov
 * @reviewer rodionov
 */

final i1 = 0;
final i2 = 1;
final i3 = 2147483647;
final i4 = +.2147483648E10;
final i5 = .9223372036854775807;
final i6 = 9223372036854775808E-100;
final i7 = +9223372036854775808e0;
final i8 = 9223372036854775809e+9223372036854775809;
final i9 = 92233720368547758080.9223372036854775808e-00124155125325235;
final i10 = 92233720368547758080.9223372036854775808e+92233720368547758080;
final i11 = 92233720368547758080.9223372036854775808E-92233720368547758080;
final i12 = 0xFF;
final i13 = 0xFfFfFfFf;
final i14 = 0xFFffFFffFFffFFff;
final i15 = 0xffffFFffffFFffffFFffffFFffffFFff;

main() {
  var x = i1+i2+i3+i4+i5+i6+i7+i8+i9+i10+i11+i12+i13+i13+i15;
  Expect.isNotNull(x);
}
