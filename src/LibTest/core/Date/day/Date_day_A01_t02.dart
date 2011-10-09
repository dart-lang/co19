/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get month();
 * Returns the day of the date [1..31].
 * @description Checks property value.
 * @author akuznecov
 * @reviewer pagolubev
 * @needsreview Assumes the property is read only.
 */


main() {
  Date date = new Date(1991, 8, 18);
  try {
    date.day = 19;
    Expect.fail("Expected NoSuchMethodException.");
  } catch (NoSuchMethodException e) {}
  Expect.isTrue(date.day == 18);
}
