/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any string may be prefixed with the character @,
 * indicating that it is a raw string, in which case no escapes are recognized.
 * @description Checks that escapes are not recognized in raw strings.
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  Expect.isFalse(r'\n' === '\x0A');
  Expect.isTrue(r'\n' === '\x5c\x6e');
  Expect.isFalse(r'\r' === '\x0D');
  Expect.isFalse(r'\b' === '\x08');
  Expect.isFalse(r'\t' === '\x09');
  Expect.isFalse(r'\v' === '\x0B');
  Expect.isFalse(r'\f' === '\x0C');

  Expect.isFalse(r"\x61" === 'a');
  Expect.isTrue(r"\x61" === '\x5c\x78\x36\x31');
  Expect.isFalse(r"\x62" === 'b');
  Expect.isFalse(r"\x63" === 'c');
  Expect.isFalse(r"\x64" === 'd');

  Expect.isFalse(r'\u2295' === '⊕');
  Expect.isTrue(r'\u2295' === '\x5c\x752295');
  Expect.isFalse(r'\u2296' === '⊖');
  Expect.isFalse(r'\u2297' === '⊗');
  Expect.isFalse(r'\u2298' === '⊘');

  Expect.isFalse(r'\u{100}' === 'Ā');
  Expect.isTrue(r'\u{100}' === '\x5c\x75{100}');
  Expect.isFalse(r'\u{101}' === 'ā');
  Expect.isFalse(r'\u{102}' === 'Ă');
  Expect.isFalse(r'\u{103}' === 'ă');
}
