/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isEven()
 * @description Checks [:isEven():] on a bunch of doubles that are not
 * equal to math integers.
 * @author pagolubev
 * @reviewer msyabro
 */


check(double d) {
  Expect.isFalse(d.isEven());
  Expect.isFalse((-d).isEven());
}

main() {
  // adjacent doubles
  check(1.0000000000000002);
  check(0.9999999999999999);
  check(1.1);
  check(0.9);
  check(1.4999999999999998);
  check(1.5000000000000002);

  check(2.0000000000000004);
  check(1.9999999999999998);
  check(2.1);
  check(1.9);
  check(2.4999999999999996);
  check(2.5000000000000004);

  check(3.0000000000000004);
  check(2.9999999999999996);
  check(3.1);
  check(2.9);
  check(3.4999999999999996);
  check(3.5000000000000004);
}
