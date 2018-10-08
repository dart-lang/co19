/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int parse(String source, {int radix, int onError(String source)})
 * Parse source as a, possibly signed, integer literal and return its value.
 *
 * The source must be a non-empty sequence of base-radix digits, optionally
 * prefixed with a minus or plus sign ('-' or '+').
 * ...
 * @description Checks that correct string can be converted to int.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(int.parse("1") == 1);
  Expect.isTrue(int.parse("01") == 1);
  Expect.isTrue(int.parse("-1") == -1);
  Expect.isTrue(int.parse("+1") == 1);
  Expect.isTrue(int.parse("0") == 0);
  Expect.isTrue(int.parse("-0") == 0);
  
  Expect.isTrue(int.parse("10") == 10);
  Expect.isTrue(int.parse("0x10") == 16);
  Expect.isTrue(int.parse("0xA") == 10);
  Expect.isTrue(int.parse("0Xff") == 255);
  
  Expect.isTrue(int.parse(" 12") == 12);
  Expect.isTrue(int.parse("12 ") == 12);
  Expect.isTrue(int.parse("\n\t 12    ") == 12);

  Expect.isTrue(int.parse("9223372036854775807") == 9223372036854775807);
  Expect.isTrue(int.parse("-9223372036854775808") == -9223372036854775808);
}
