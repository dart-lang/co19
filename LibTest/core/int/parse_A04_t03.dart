// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int parse(String source, {int radix})
/// Parse source as a, possibly signed, integer literal and return its value.
/// ...
/// If no radix is given then it defaults to 10. In this case, the source digits
/// may also start with 0x, in which case the number is interpreted as
/// a hexadecimal literal, which effectively means that the 0x is ignored and the
/// radix is instead set to 16.
/// ...
/// @description Checks that if no radix is given but there is 0x prefix that
/// mean that radix is 16
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

main() {
  Expect.equals(int.parse("1", radix: 16), int.parse("0x1"));
  Expect.equals(int.parse("12", radix: 16), int.parse("0x12"));
  Expect.equals(int.parse("a", radix: 16), int.parse("0xa"));
  Expect.equals(int.parse("F", radix: 16), int.parse("0xF"));
}
