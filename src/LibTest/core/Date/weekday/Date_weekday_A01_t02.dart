/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get weekday()
 * Returns the week day [MON..SUN]. If the date is invalid throws an exception.
 * @description Checks that an exception is thrown when the date is invalid.
 * @author pagolubev
 * @reviewer rodionov
 * @needsreview Exception is not specified.
 */


void check(Date date) {
  try {
    int wd = date.weekday;
    Expect.fail("Exception expected."); // TODO
  } catch (var e) {}
}

main() {
  check(new Date(2000, 12, 32));
  check(new Date(2000, 12, -1));
  check(new Date(2000, 12, 0));

  check(new Date(2000, 13, 1));
  check(new Date(2000, -1, 1));
  check(new Date(2000, 0, 1));

  check(new Date(-1, 12, 1));
  check(new Date(-1, 13, -1));
}
