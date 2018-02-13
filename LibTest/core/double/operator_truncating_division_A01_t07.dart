/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int operator ~/(num other)
 * @description Performs returned value checks on a bunch of values.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

check(int expected, double a, double b) {
  Expect.identical(expected, a ~/ b);
  Expect.identical(expected, (-a) ~/ (-b));
  Expect.identical(-expected, (-a) ~/ b);
  Expect.identical(-expected, a ~/ (-b));
}

main() {
  check(0, 1.1, 2.0);
  check(0, 5.0, 10.0);
  check(2, 6.0, 3.0);
  check(1, 17.0, 17.0);
  check(23, 11.735, .5);
  check(12, 6.1, .5);
  check(0, 0.1, 1.0);
  check(4, 1.254e12, 2.567e11);
  check(100, 1.0, 0.01);
}
