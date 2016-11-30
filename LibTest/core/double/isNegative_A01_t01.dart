/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isNegative
 * @description Checks [:isNegative:] on double special values.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isFalse(.0.isNegative);
  Expect.isTrue((-.0).isNegative);

  double min = 4.9406564584124654e-324;
  Expect.isFalse(min.isNegative);
  Expect.isTrue((-min).isNegative);

  double min_normal = 2.2250738585072014e-308;
  Expect.isFalse(min_normal.isNegative);
  Expect.isTrue((-min_normal).isNegative);

  double max_normal = 1.7976931348623157e308;
  Expect.isFalse(max_normal.isNegative);
  Expect.isTrue((-max_normal).isNegative);

  double inf = 1 / 0;
  Expect.isFalse(inf.isNegative);
  Expect.isTrue((-inf).isNegative);

  double nan = 0 / 0;
  Expect.isFalse(nan.isNegative);
  Expect.isFalse((-nan).isNegative);
}
