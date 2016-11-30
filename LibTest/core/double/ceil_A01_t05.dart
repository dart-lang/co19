/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int ceil()
 * Returns the least integer no smaller than this.
 * @description Checks that if [:ceil():] is called on a value less than zero
 * but greater than -1.0,then the result is zero.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

check(double d) {
  Expect.equals(0, d.ceil());
}

main() {
  check(-4.9406564584124654e-324); // min value
  check(-2.2250738585072014e-308); // min normal
  check(-0.1);
  check(-0.5);
  check(-0.6);
  check(-0.8);
  check(-0.95);
  check(-0.9999999999999999); // adjacent to -1.0
}
