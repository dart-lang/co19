/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double abs()
 * @description Checks that if value is not negative, the same value is returned.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";


check(double arg) {
  Expect.isTrue(arg >= 0);
  Expect.equals(arg, arg.abs());
}

main() {
  check(.0);
  check(1.21321);
  check(123.5463);
  check(74353.672);
  check(145.643);
  check(342123.4);
  check(4.9406564584124654e-324); // min double
  check(2.2250738585072014e-308); // min normal
  check(1.7976931348623157e308); // max normal
}
