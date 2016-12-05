/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isNaN
 * @description Checks the method on special values.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

check_not_nan(double d) {
  Expect.isFalse(d.isNaN);
  Expect.isFalse((-d).isNaN);
}

main() {
  // min subnormal
  check_not_nan(4.9406564584124654e-324);

  // max subnormal
  check_not_nan(2.2250738585072009e-308);

  // min normal
  check_not_nan(2.2250738585072014e-308);;

  // max normal
  check_not_nan(1.7976931348623157e308);

  // infinity
  check_not_nan(1 / .0);

  check_not_nan(.0);
}
