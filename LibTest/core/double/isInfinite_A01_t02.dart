/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isInfinite
 * @description Checks non infinite double values.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

check(double d) {
  Expect.isFalse(d.isInfinite);
  Expect.isFalse((-d).isInfinite);
}

main() {
  // min subnormal
  check(4.9406564584124654e-324);

  // max subnormal
  check(2.2250738585072009e-308);

  // min normal
  check(2.2250738585072014e-308);

  // max normal
  check(1.7976931348623157e308);

  check(1.0);

  check(.5);

  check(.0);
}
