/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isEven()
 * @description Checks the method on special values.
 * @author pagolubev
 * @reviewer msyabro
 */


check(double d, bool expected) {
  Expect.equals(d.isEven(), expected);
  Expect.equals((-d).isEven(), expected);
}

main() {
  // min subnormal
  check(4.9406564584124654e-324, false);
  // min normal
  check(2.2250738585072014e-308, false);
  // max normal
  check(1.7976931348623157e308, true);
}
