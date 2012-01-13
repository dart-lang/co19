/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator ~/(num other)
 * @description Performs returned value checks on a bunch of values.
 * @author pagolubev
 * @reviewer msyabro
 */


check(double expected, double a, double b) {
  Expect.equals(expected, a ~/ b);
  Expect.equals(expected, (-a) ~/ (-b));
  Expect.equals(-expected, (-a) ~/ b);
  Expect.equals(-expected, a ~/ (-b));
}

main() {
  check(.0, 1.1, 2.0);
  check(.0, 5.0, 10.0);
  check(2.0, 6.0, 3.0);
  check(1.0, 17.0, 17.0);
  check(23.0, 11.735, .5);
  check(12.0, 6.1, .5);
  check(.0, 0.1, 1.0);
  check(4.0, 1.254e12, 2.567e11);
  check(100.0, 1.0, 0.01);
}
