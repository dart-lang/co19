/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Strings support escape sequences for special characters. The
 * escapes are:
 * . . .
 * • \u{HEX_DIGIT_SEQUENCE} is the unicode scalar value represented by the
 *   HEX_DIGIT_SEQUENCE. It is a compile-time error when the value of the
 *   HEX_DIGIT_SEQUENCE is not a valid unicode scalar value.
 * HEX_DIGIT_SEQUENCE:
 *   HEX_DIGIT HEX_DIGIT? HEX_DIGIT? HEX_DIGIT? HEX_DIGIT? HEX_DIGIT?
 * ;
 * @description Checks that \u{HEX_DIGIT_SEQUENCE} is the unicode scalar
 * value represented by the HEX_DIGIT_SEQUENCE.
 * @author msyabro
 * @reviewer rodionov
 * @needsreview  issie 1357
 */
import '../../../Utils/expect.dart';

main() {
  Expect.identical('\u{61}', 'a');
  Expect.identical('\u{62}', 'b');
  Expect.identical('\u{63}', 'c');
  Expect.identical('\u{64}', 'd');

  Expect.identical('\u{41}', 'A');
  Expect.identical('\u{42}', 'B');
  Expect.identical('\u{43}', 'C');
  Expect.identical('\u{44}', 'D');

  Expect.identical('\u{31}', '1');
  Expect.identical('\u{32}', '2');
  Expect.identical('\u{33}', '3');
  Expect.identical('\u{34}', '4');

  Expect.identical('\u{100}', 'Ā');
  Expect.identical('\u{101}', 'ā');
  Expect.identical('\u{102}', 'Ă');
  Expect.identical('\u{103}', 'ă');

  Expect.identical('\u{1E60}', 'Ṡ');
  Expect.identical('\u{1E61}', 'ṡ');
  Expect.identical('\u{1E62}', 'Ṣ');
  Expect.identical('\u{1E63}', 'ṣ');

  Expect.identical('\u{2295}', '⊕');
  Expect.identical('\u{2296}', '⊖');
  Expect.identical('\u{2297}', '⊗');
  Expect.identical('\u{2298}', '⊘');

  Expect.identical('\u{df}', 'ß');
  Expect.identical('\u{b5}', 'µ');
  Expect.identical('\u{ae}', '®');
  Expect.identical('\u{a5}', '¥');

  Expect.identical('\u{a5}', '\u{0000a5}');
  Expect.identical('\u{a5}', '\u{000a5}');
  Expect.identical('\u{a5}', '\u{00a5}');
  Expect.identical('\u{a5}', '\u{0a5}');
}
