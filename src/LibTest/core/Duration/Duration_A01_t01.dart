/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The duration is the sum of all individual parts. This means that
 *            individual parts don't need to be less than the next-bigger unit.
 *            For example [hours] is allowed to have a value greater than 23.
 * @description Checks that a Duration instance can be created without error using
 *              various non-negative integer arguments.
 * @author akuznecov
 * @reviewer rodionov
 * @reviewer msyabro
 */

main() {
  check(0, 0, 0, 0, 0);
  check(1, 1, 1, 1, 1);
  check(30, 10, 20, 45, 700);
  check(0x7fffffff, 0, 0x7fffffff, 0, 0x7fffffff);
  check(0, 0x80000000, 0, 0x80000000, 0);
  check(0x7fffffffffffffff, 0, 0x7fffffffffffffff, 0, 0x7fffffffffffffff);
  check(0, 0x8000000000000000, 0, 0x8000000000000000, 0);
}

void check(int d, int h, int m, int s, int ms) {
  Expect.isTrue(new Duration(d, h, m, s, ms) is Duration);
}
