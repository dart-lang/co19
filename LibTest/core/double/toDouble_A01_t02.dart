/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double toDouble()
 * @description Checks [:toDouble():] on special values.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";


inner_check(d) {
  var v = d.toDouble();
  Expect.isTrue(v is double);
  Expect.equals(v, d);
}

check(double d) {
  inner_check(d);
  inner_check(-d);
}

main() {
  check(.0);
  check(-.0);
  check(4.9406564584124654e-324); // min subnormal
  check(2.2250738585072014e-308); // min normal
  check(1.7976931348623157e308); // max normal
  check(1 / 0);
  Expect.isTrue((0 / 0).toDouble().isNaN);
}
