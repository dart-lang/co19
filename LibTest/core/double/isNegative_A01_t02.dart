/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isNegative
 * @description Checks bunch of values.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  double start = 0.1;
  double step = 117.73;
  double end = start + 20 * step;
  for (double d = start; d < end; d += step) {
    Expect.isFalse(d.isNegative);
    Expect.isTrue((-d).isNegative);
  }
}
