// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Strings support escape sequences for special characters. The
/// escapes are:
/// . . .
/// • \u{HEX_DIGIT_SEQUENCE} is the unicode scalar value represented by the
///   HEX_DIGIT_SEQUENCE. It is a compile-time error when the value of the
///   HEX_DIGIT_SEQUENCE is not a valid unicode scalar value.
/// HEX_DIGIT_SEQUENCE:
///   HEX_DIGIT HEX_DIGIT? HEX_DIGIT? HEX_DIGIT? HEX_DIGIT? HEX_DIGIT?
/// ;
/// @description Checks that \u{HEX_DIGIT_SEQUENCE} is the unicode scalar
/// value represented by the HEX_DIGIT_SEQUENCE.
/// @author msyabro
/// @needsreview  issie 1357

import '../../../Utils/expect.dart';

main() {
  const CheckIdentical('\u{61}', 'a');
  const CheckIdentical('\u{62}', 'b');
  const CheckIdentical('\u{63}', 'c');
  const CheckIdentical('\u{64}', 'd');

  const CheckIdentical('\u{41}', 'A');
  const CheckIdentical('\u{42}', 'B');
  const CheckIdentical('\u{43}', 'C');
  const CheckIdentical('\u{44}', 'D');

  const CheckIdentical('\u{31}', '1');
  const CheckIdentical('\u{32}', '2');
  const CheckIdentical('\u{33}', '3');
  const CheckIdentical('\u{34}', '4');

  const CheckIdentical('\u{100}', 'Ā');
  const CheckIdentical('\u{101}', 'ā');
  const CheckIdentical('\u{102}', 'Ă');
  const CheckIdentical('\u{103}', 'ă');

  const CheckIdentical('\u{1E60}', 'Ṡ');
  const CheckIdentical('\u{1E61}', 'ṡ');
  const CheckIdentical('\u{1E62}', 'Ṣ');
  const CheckIdentical('\u{1E63}', 'ṣ');

  const CheckIdentical('\u{2295}', '⊕');
  const CheckIdentical('\u{2296}', '⊖');
  const CheckIdentical('\u{2297}', '⊗');
  const CheckIdentical('\u{2298}', '⊘');

  const CheckIdentical('\u{df}', 'ß');
  const CheckIdentical('\u{b5}', 'µ');
  const CheckIdentical('\u{ae}', '®');
  const CheckIdentical('\u{a5}', '¥');

  const CheckIdentical('\u{a5}', '\u{0000a5}');
  const CheckIdentical('\u{a5}', '\u{000a5}');
  const CheckIdentical('\u{a5}', '\u{00a5}');
  const CheckIdentical('\u{a5}', '\u{0a5}');
}
