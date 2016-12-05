/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int parse(String source, {int radix, int onError(String source)})
 * Parse source as a, possibly signed, integer literal and return its value.
 * ...
 * If no radix is given then it defaults to 10. In this case, the source digits
 * may also start with 0x, in which case the number is interpreted as
 * a hexadecimal literal, which effectively means that the 0x is ignored and the
 * radix is instead set to 16.
 * ...
 * @description Checks that if no radix is given then it defaults to 10
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(1, int.parse("1"));
  Expect.equals(12, int.parse("12"));
  Expect.equals(123, int.parse("123"));
  Expect.equals(1234, int.parse("1234"));
  Expect.equals(12345, int.parse("12345"));
  Expect.equals(-1, int.parse("-1"));
  Expect.equals(-12, int.parse("-12"));
  Expect.equals(-123, int.parse("-123"));
  Expect.equals(-1234, int.parse("-1234"));
  Expect.equals(-12345, int.parse("-12345"));
}
