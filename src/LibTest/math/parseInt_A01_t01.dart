/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Converts String to Int
 * @description Checks that correct string can be converted to int.
 * @author msyabro
 * @reviewer pagolubev
 */

import "dart:math" as Math;

main() {
  Expect.isTrue(Math.parseInt("1") == 1);
  Expect.isTrue(Math.parseInt("01") == 1);
  Expect.isTrue(Math.parseInt("-1") == -1);
  Expect.isTrue(Math.parseInt("+1") == 1);
  Expect.isTrue(Math.parseInt("0") == 0);
  Expect.isTrue(Math.parseInt("-0") == 0);
  
  Expect.isTrue(Math.parseInt("9223372036854775808") == 9223372036854775808); //maximum int64 + 1
  Expect.isTrue(Math.parseInt("-9223372036854775809") == -9223372036854775809); //minimum int64 - 1
  
  Expect.isTrue(Math.parseInt("10") == 10);
  Expect.isTrue(Math.parseInt("0x10") == 16);
  Expect.isTrue(Math.parseInt("0xA") == 10);
  Expect.isTrue(Math.parseInt("0Xff") == 255);
  
  Expect.isTrue(Math.parseInt(" 12") == 12);
  Expect.isTrue(Math.parseInt("12 ") == 12);
  Expect.isTrue(Math.parseInt("\n\t 12    ") == 12);
}
