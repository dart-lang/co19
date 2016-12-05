/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isNaN
 * @description Checks that some operations with NaN results to NaN.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

check_nan(double d) {
  Expect.isTrue(d.isNaN);
}

main() {
  double nan = 0 / 0;
  check_nan(nan + nan);
  check_nan(nan * nan);
  check_nan(nan - nan);
  check_nan(nan / nan);
  check_nan(nan % nan);
  check_nan(nan  * 42.0);
}
