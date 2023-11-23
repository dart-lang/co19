// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Strings support escape sequences for special characters. The
/// escapes are:
/// . . .
/// • \uHEX_DIGIT1 HEX_DIGIT2 HEX_DIGIT3 HEX_DIGIT4, equivalent to
///   \u{ HEX_DIGIT1 HEX_DIGIT2 HEX_DIGIT3 HEX_DIGIT4}.
/// @description Checks that \uHEX_DIGIT1 HEX_DIGIT2 HEX_DIGIT3 HEX_DIGIT4 is
/// equivalent to \u{ HEX_DIGIT1 HEX_DIGIT2 HEX_DIGIT3 HEX_DIGIT4}.
/// @author msyabro

import '../../../Utils/expect.dart';

main() {
  const CheckIdentical('\u0000', '\u{0000}');
  const CheckIdentical('\u0001', '\u{0001}');
  const CheckIdentical('\u0002', '\u{0002}');
  const CheckIdentical('\u0003', '\u{0003}');
  const CheckIdentical('\u0004', '\u{0004}');
  const CheckIdentical('\u0005', '\u{0005}');
  const CheckIdentical('\u0006', '\u{0006}');
  const CheckIdentical('\u0007', '\u{0007}');
  const CheckIdentical('\u0008', '\u{0008}');
  const CheckIdentical('\u0009', '\u{0009}');
  const CheckIdentical('\u000a', '\u{000a}');
  const CheckIdentical('\u000B', '\u{000B}');
  const CheckIdentical('\u000C', '\u{000c}');
  const CheckIdentical('\u000D', '\u{000D}');
  const CheckIdentical('\u000e', '\u{000E}');
  const CheckIdentical('\u000f', '\u{000f}');

  const CheckIdentical('\uabcd', '\u{ABCD}');
  const CheckIdentical('\u1f1f', '\u{1f1f}');
  const CheckIdentical('\ua0b0', '\u{a0b0}');
  const CheckIdentical('\u1a12', '\u{1a12}');
  const CheckIdentical('\uEEEE', '\u{EEEE}');
  const CheckIdentical('\uffff', '\u{ffff}');
}
