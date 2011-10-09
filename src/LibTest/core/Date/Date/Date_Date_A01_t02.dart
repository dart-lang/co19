/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Date(int year, int month, int day)
 * No checks are performed on the input values.
 * @description Checks that any integers are accepted in constructor.
 * @author akuznecov
 * @needsreview Why -2^64-1 complement for 2^64 is -(2^64-1) or -9223372036854775807
 */


main() {
  Date date;

  date = new Date(1991, 8, 18);   // correct

  date = new Date(18, 8, 1991); // incorrect, but accepted

  date = new Date(-1991, 8, 18);
  date = new Date(1991, -8, 18);
  date = new Date(1991, 8, -18);
  date = new Date(-1991, -8, -18);

  date = new Date(1991, 13, 18);
  date = new Date(1991, 8, 32);

  date = new Date(9223372036854775808, 9223372036854775808, 9223372036854775808); // 2^64
  date = new Date(-9223372036854775809, -9223372036854775809, -9223372036854775809); // -2^64-1
}
