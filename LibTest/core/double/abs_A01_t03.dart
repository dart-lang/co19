/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double abs()
 * @description Checks that if the value is infinite, the result is positive
 * infinity.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  double inf = 1 / 0;
  Expect.equals(inf, inf.abs());
  Expect.equals(inf, (-inf).abs());
}
