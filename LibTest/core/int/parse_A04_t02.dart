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
 * @description Checks that if no radix is given then it defaults to 10. Test
 * invalid values
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {int.parse("1a");});
  Expect.throws(() {int.parse("1A");});
  Expect.throws(() {int.parse("0z");});
  Expect.throws(() {int.parse("a1");});
  Expect.throws(() {int.parse("A0");});
}
