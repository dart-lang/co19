/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String Date.toString() returns stirng representation of date
 * in format "${year}-${twoDigitMonth}-${twoDigitDay}"
 * @description Check toString method implementation
 * @author akuznecov
 */


main() {
  Date date = new Date(0, 0, 0);
  Expect.isTrue(date.toString() is String);
  Expect.equals(date.toString(), "0-00-00");

  date = new Date(1, 1, 1);
  Expect.equals(date.toString(), "1-01-01");

  date = new Date(1991, 8, 18);
  Expect.equals(date.toString(), "1991-08-18");

  date = new Date(1991, 8, 100);
  Expect.equals(date.toString(), "1991-08-100");

  date = new Date(1991, 100, 18);
  Expect.equals(date.toString(), "1991-100-18");

  date = new Date(1991, 8, 9223372036854775807);
  Expect.equals(date.toString(), "1991-08-9223372036854775807");
  
  date = new Date(1991, 9223372036854775807, 18);
  Expect.equals(date.toString(), "1991-9223372036854775807-18");

  date = new Date(9223372036854775807, 8, 18);
  Expect.equals(date.toString(), "9223372036854775807-08-18");

  date = new Date(9223372036854775807, 9223372036854775807, 9223372036854775807);
  Expect.equals(date.toString(), "9223372036854775807-9223372036854775807-9223372036854775807");
}
