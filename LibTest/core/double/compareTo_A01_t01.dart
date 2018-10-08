/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int compareTo(Comparable other)
 * @description Checks that [:compareTo():] returns 0 if values are equal.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";


check(double d) {
  Expect.equals(d.compareTo(d), 0);
}

main() {
  // sample values
  check(-328838322.0992929);
  check(328838322.0992929);
  check(-12.283200202348833e-100);
  check(12.283200202348833e-100);
  check(-0.001303222343594593434230530385);
  check(0.001303222343594593434230530385);

  // zero
  check(0.0);
  check(-0.0);
  check(.0);
  check(-.0);

  // min subnormal
  check(4.9406564584124654e-324);
  check(-4.9406564584124654e-324);

  // max subnormal
  check(2.2250738585072009e-308);
  check(-2.2250738585072009e-308);

  // min normal
  check(2.2250738585072014e-308);
  check(-2.2250738585072014e-308);

  // max normal
  check(1.7976931348623157e308);
  check(-1.7976931348623157e308);

  // infinity
  check(1 / .0);
  check(-1 / .0);
}
