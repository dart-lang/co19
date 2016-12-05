/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Double is contagious.
 * @description Checks that arithmetic operations (except those that specify int
 * as return type) on a double and an int yield double.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

check(d) {
  Expect.isTrue(d is double, '$d expected to be double');
}

main() {
  check(2.0 + 2);
  check(2 + 2.0);
  check(2.0 - 2);
  check(2 - 2.0);
  check(2.0 * 2);
  check(2 * 2.0);
  check(2.0 / 2);
  check(2 / 2.0);
  check(4.0 % 2);
  check(4 % 2.0);
  check(4.0.remainder(2));
  check(4.remainder(2.0));
}
