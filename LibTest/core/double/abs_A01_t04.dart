/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double abs()
 * @description Checks that if the value is NaN, the result is NaN.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  double nan = 0 / 0;
  Expect.isTrue(nan.abs().isNaN);
  Expect.isTrue((-nan).abs().isNaN);
}
