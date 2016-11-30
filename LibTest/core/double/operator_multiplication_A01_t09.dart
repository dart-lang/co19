/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator *(num other)
 * @description Checks on a various values witch neither an infinity, nor a NaN,
 * nor a zero.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(1.2100000000000002,         1.1 * 1.1);
  Expect.equals(7.3125,                     3.25 * 2.25);
  Expect.equals(16.000016000000002,         0.16 * 100.0001);
  Expect.equals(2.536987E-6,                25.36987 * 0.0000001);
  Expect.equals(50.0,                       100.0 * 0.5);
  Expect.equals(10000.0,                    10.0 * 1000.0);
  Expect.equals(1.0E-4,                     0.01 * 0.01);
  Expect.equals(15.0,                       5.0 * 3.0);

  Expect.equals(2.826516E9,                 1.254e7 * 2.254e2);
  Expect.equals(5.220337253306499,          2.34574457e5 * 2.22545e-5);
  Expect.equals(1.39506569745274896E17,     5.6997857e8 * 2.4475757e8);
  Expect.equals(9.21170839851E109,          4.324745727e9 * 2.13e100);
  Expect.equals(5.774743427317105E93,       5.122742757e-7 * 1.1272757e100);
  Expect.equals(9.200704E-12,               1.234e-5 * 7.456e-7);
  Expect.equals(6.05888936E-48,             2.7848e-3 * 2.1757e-45);
  Expect.equals(5.2216044443507045E56,      46.4555555547215757e45 * 1.124e10);
  Expect.equals(1.82890337534275E-154,      1.254757e96 * 1.45757575e-250);
  Expect.equals(4.3361436474972E-209,       5.127178e-110 * 8.457174e-100);
  Expect.equals(2.3084448159222407E-228,    9.4271575757575757E-115 * 2.4487177575757577E-114);
  Expect.equals(-2.7946E-218,               -1.256e-118 * 2.225e-100);
  Expect.equals(14.2588875,                 3.4567e100 * 4.125e-100);
  Expect.equals(8.126733293900002E-89,      1.457527e-45 * 5.5757e-44);
  Expect.equals(1.184611519479339E-37,      8.1272727e-50 * 1.4575757e12);
  Expect.equals(1.2506929151829E279,        1.4787878e233 * 8.457555e45);
  Expect.equals(3.307841517843742E-299,     6.457575751e-200 * 5.12242e-100);
  Expect.equals(9.980893515147121E144,      8.0121021e255 * 1.2457272e-111);
  Expect.equals(7.24390630297152E181,       5.9748484848e189 * 0.12124e-7);
}
