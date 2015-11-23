/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Strings support escape sequences for special characters. The
 * escapes are:
 * . . .
 * • \uHEX_DIGIT1 HEX_DIGIT2 HEX_DIGIT3 HEX_DIGIT4, equivalent to
 *   \u{ HEX_DIGIT1 HEX_DIGIT2 HEX_DIGIT3 HEX_DIGIT4}.
 * @description Checks that \uHEX_DIGIT1 HEX_DIGIT2 HEX_DIGIT3 HEX_DIGIT4 is
 * equivalent to \u{ HEX_DIGIT1 HEX_DIGIT2 HEX_DIGIT3 HEX_DIGIT4}.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

main() {
  Expect.identical('\u0000', '\u{0000}');
  Expect.identical('\u0001', '\u{0001}');
  Expect.identical('\u0002', '\u{0002}');
  Expect.identical('\u0003', '\u{0003}');
  Expect.identical('\u0004', '\u{0004}');
  Expect.identical('\u0005', '\u{0005}');
  Expect.identical('\u0006', '\u{0006}');
  Expect.identical('\u0007', '\u{0007}');
  Expect.identical('\u0008', '\u{0008}');
  Expect.identical('\u0009', '\u{0009}');
  Expect.identical('\u000a', '\u{000a}');
  Expect.identical('\u000B', '\u{000B}');
  Expect.identical('\u000C', '\u{000c}');
  Expect.identical('\u000D', '\u{000D}');
  Expect.identical('\u000e', '\u{000E}');
  Expect.identical('\u000f', '\u{000f}');

  Expect.identical('\uabcd', '\u{ABCD}');
  Expect.identical('\u1f1f', '\u{1f1f}');
  Expect.identical('\ua0b0', '\u{a0b0}');
  Expect.identical('\u1a12', '\u{1a12}');
  Expect.identical('\uEEEE', '\u{EEEE}');
  Expect.identical('\uffff', '\u{ffff}');
}
