/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Double-literals have to be written as decimals or exponent without any suffix.
 * @description Checks that decimals are read as doubles.
 * @author pagolubev
 */


main() {
  Expect.isTrue(+0.0 is double);
  Expect.isTrue(0.0 is double);
  Expect.isTrue(-0.0 is double);

  Expect.isTrue(+0.0 is double);
  Expect.isTrue(0.0 is double);
  Expect.isTrue(-0.0 is double);

  Expect.isTrue(+.0 is double);
  Expect.isTrue(.0 is double);
  Expect.isTrue(-.0 is double);

  Expect.isTrue(+0.0 is double);
  Expect.isTrue(0.0 is double);
  Expect.isTrue(-0.0 is double);

  Expect.isTrue(9.99 is double);
  Expect.isTrue(.99 is double);
  Expect.isTrue(-.99 is double);
  Expect.isTrue(-13.99 is double);
  Expect.isTrue(7.0 is double);
  Expect.isTrue(-2.0 is double);
  Expect.isTrue(2e5 is double);
  Expect.isTrue(1e0 is double);
  Expect.isTrue(1e-1 is double);

  Expect.isTrue(4.9406564584124654e-324 is double); // min subnormal
  Expect.isTrue(4.9406564584124653e-324 is double);

  Expect.isTrue(-4.9406564584124654e-324 is double);
  Expect.isTrue(-4.9406564584124653e-324 is double);

  Expect.isTrue(2.2250738585072009e-308 is double); // max subnormal
  Expect.isTrue(2.2250738585072012e-308 is double);

  Expect.isTrue(-2.2250738585072009e-308 is double);
  Expect.isTrue(-2.2250738585072012e-308 is double);

  Expect.isTrue(2.2250738585072000e-308 is double);
  Expect.isTrue(-2.2250738585072000e-308 is double);

  Expect.isTrue(2.2250738585072014e-308 is double); // min normal
  Expect.isTrue(-2.2250738585072014e-308 is double);

  Expect.isTrue(1.7976931348623157e308 is double); // max double
  Expect.isTrue(-1.7976931348623157e308 is double);
  Expect.isTrue(1e1000 is double);
  Expect.isTrue(-1e1000 is double);
}
