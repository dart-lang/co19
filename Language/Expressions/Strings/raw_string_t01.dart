/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any string may be prefixed with the character 'r',
 * indicating that it is a raw string, in which case no escapes or
 * interpolations are recognized.
 * @description Checks that escapes are not recognized in raw strings.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  Expect.isFalse(identical(r'\n', '\x0A'));
  Expect.isTrue(identical(r'\n', '\x5c\x6e'));
  Expect.isFalse(identical(r'\r', '\x0D'));
  Expect.isFalse(identical(r'\b', '\x08'));
  Expect.isFalse(identical(r'\t', '\x09'));
  Expect.isFalse(identical(r'\v', '\x0B'));
  Expect.isFalse(identical(r'\f', '\x0C'));

  Expect.isFalse(identical(r"\x61", 'a'));
  Expect.isTrue(identical(r"\x61", '\x5c\x78\x36\x31'));
  Expect.isFalse(identical(r"\x62", 'b'));
  Expect.isFalse(identical(r"\x63", 'c'));
  Expect.isFalse(identical(r"\x64", 'd'));

  Expect.isFalse(identical(r'\u2295', '⊕'));
  Expect.isTrue(identical(r'\u2295', '\x5c\x752295'));
  Expect.isFalse(identical(r'\u2296', '⊖'));
  Expect.isFalse(identical(r'\u2297', '⊗'));
  Expect.isFalse(identical(r'\u2298', '⊘'));

  Expect.isFalse(identical(r'\u{100}', 'Ā'));
  Expect.isTrue(identical(r'\u{100}', '\x5c\x75{100}'));
  Expect.isFalse(identical(r'\u{101}', 'ā'));
  Expect.isFalse(identical(r'\u{102}', 'Ă'));
  Expect.isFalse(identical(r'\u{103}', 'ă'));
}
