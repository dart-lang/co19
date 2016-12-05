/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator +(num other)
 * @description Checks on a various values witch neither an infinity, nor a NaN,
 * nor a zero
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(1.2000000000000002,      1.1 + 0.1);
  Expect.equals(2.1,                     1.1 + 1.0);
  Expect.equals(150.5,                   100.0 + 50.5);
  Expect.equals(1.00000001,              1.0 + 0.00000001);
  Expect.equals(4.181E-15,               1.725e-15 + 2.456e-15);
  Expect.equals(2.88037E17,              2.3568e17 + 5.2357e16);
  Expect.equals(10.01025,                10.01 + 0.00025);
  Expect.equals(0.33332999999999996,     0.3333 + 0.00003);
  Expect.equals(1.7036568000000002E257,  1.2457787e257 + 0.4578781e257);
  Expect.equals(8.242662E-256,           0.2457784e-255 + 0.5784878e-255);
  Expect.equals(8.0E-7,                  0.0000005 + 0.0000003);
  Expect.equals(8.0,                     5.0 + 3.0);
  Expect.equals(0.358023,                0.123456 + 0.234567);
  Expect.equals(-9.1E-8,                 -1.25e-7 + 3.4e-8);
  Expect.equals(-2.6599999999999998E125, -5e125 + 2.34e125);
  Expect.equals(2.22498744E-10,          -1.256e-15 + 2.225e-10);
  Expect.equals(2.6892021019100004E57,   2.25678978879e57 + 0.43241231312e57);
  Expect.equals(8.813250000000001E-44,   2.4545e-45 + 8.5678e-44);
  Expect.equals(3.6248000000000003E301,  24.124e300 + 12.124e300);
  Expect.equals(8.379E-299,              1.234e-299 + 7.145e-299);
  Expect.equals(1.6039726919262522E77,   1.4561875677841278E77 + 0.1477851241421244E77);
  Expect.equals(9.502893000151215E95,    3.0457172455754577E95 + 6.4571757545757575E95);
  Expect.equals(4.6046572272209036E-70,  0.4571747814451457E-70 + 4.1474824457757575E-70);
  Expect.equals(3.391433515151515E-114,  9.4271575757575757E-115 + 2.4487177575757577E-114);
}
