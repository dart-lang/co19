/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int toInt()
 * @description Checks [:toInt():] on special values.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";


inner_check(argument) {
  var v = argument.toInt();
  Expect.isTrue(v is int);
  Expect.equals(v, argument.truncate());
}

check(double argument) {
  inner_check(argument);
  inner_check(-argument);
}

main() {
  check(.0);
  check(-.0);
  check(4.9406564584124654e-324); // min subnormal
  check(2.2250738585072014e-308); // min normal
  check(1.7976931348623157e308); // max normal
}
