/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int parse(String source)
 * Parse source as an integer literal and return its value.
 * Accepts "0x" prefix for hexadecimal numbers, otherwise defaults to base-10.
 * @description Checks that correct string can be converted to int.
 * @author msyabro
 * @reviewer pagolubev
 */

main() {
  Expect.isTrue(int.parse("1") == 1);
  Expect.isTrue(int.parse("01") == 1);
  Expect.isTrue(int.parse("-1") == -1);
  Expect.isTrue(int.parse("+1") == 1);
  Expect.isTrue(int.parse("0") == 0);
  Expect.isTrue(int.parse("-0") == 0);
  
  Expect.isTrue(int.parse("9223372036854775808") == 9223372036854775808); //maximum int64 + 1
  Expect.isTrue(int.parse("-9223372036854775809") == -9223372036854775809); //minimum int64 - 1
  
  Expect.isTrue(int.parse("10") == 10);
  Expect.isTrue(int.parse("0x10") == 16);
  Expect.isTrue(int.parse("0xA") == 10);
  Expect.isTrue(int.parse("0Xff") == 255);
  
  Expect.isTrue(int.parse(" 12") == 12);
  Expect.isTrue(int.parse("12 ") == 12);
  Expect.isTrue(int.parse("\n\t 12    ") == 12);
}
