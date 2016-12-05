/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator /(num other)
 * @description Checks on a various values witch neither an infinity, nor a NaN,
 * nor a zero.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(1.4444444444444444,      3.25 / 2.25);
  Expect.equals(0.0015999984000016,      0.16 / 100.0001);
  Expect.equals(2.536987E8,              25.36987 / 0.0000001);
  Expect.equals(200.0,                   100.0 / 0.5);
  Expect.equals(0.01,                    10.0 / 1000.0);
  Expect.equals(0.04761904761904762,     0.01 / 0.21);
  Expect.equals(1.6666666666666667,      5.0 / 3.0);
  Expect.equals(0.3333333333333333,      1.0 / 3.0);
  Expect.equals(1.0E-10,                 1.0 / 1e10);

  Expect.equals(55634.42768411712,       1.254e7 / 2.254e2);
  Expect.equals(7.888349514563106E-5,    3.25e8 / 4.12e12);
  Expect.equals(1.0540540430025389E10,   2.34574457e5 / 2.22545e-5);
  Expect.equals(2.3287474622337525,      5.6997857e8 / 2.4475757e8);
  Expect.equals(2.0303970549295775E-91,  4.324745727e9 / 2.13e100);
  Expect.equals(4.544356590849958E-107,  5.122742757e-7 / 1.1272757e100);
  Expect.equals(16.55042918454936,       1.234e-5 / 7.456e-7);
  Expect.equals(1.2799558762697064E42,   2.7848e-3 / 2.1757e-45);
  Expect.equals(4.133056544014375E36,    46.4555555547215757e45 / 1.124e10);
  Expect.equals(6.062519229236622E-11,   5.127178e-110 / 8.457174e-100);
  Expect.equals(0.38498342843278544,     9.4271575757575757E-115 / 2.4487177575757577E-114);
  Expect.equals(-5.644943820224719E-19,  -1.256e-118 / 2.225e-100);
  Expect.equals(8.379878787878789E199,   3.4567e100 / 4.125e-100);
  Expect.equals(0.026140699822443818,    1.457527e-45 / 5.5757e-44);
  Expect.equals(5.5758837774257624E-62,  8.1272727e-50 / 1.4575757e12);
  Expect.equals(1.74848144647005E187,    1.4787878e233 / 8.457555e45);
  Expect.equals(1.2606494100444712E-100, 6.457575751e-200 / 5.12242e-100);
  Expect.equals(4.928116533157374E197,   5.9748484848e189 / 0.12124e-7);
}
