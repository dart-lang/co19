/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int get year()
 * Returns the year of the date.
 * @description Checks property value.
 * @author akuznecov
 * @reviewer pagolubev
 * @needsreview Behaviour when date is invalid is not specified.
 * TO DO: call property on invalid date instance.
 */


main() {
  Date date = new Date(1991, 8, 18);
  var year = date.year;
  Expect.isTrue(year is int);
  Expect.isTrue(year == 1991);
}
