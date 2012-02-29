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
  Expect.isFalse(@'\n' === '\x0A');
  Expect.isTrue(@'\n' === '\x5c\x6e');
  Expect.isFalse(@'\r' === '\x0D');
  Expect.isFalse(@'\b' === '\x08');
  Expect.isFalse(@'\t' === '\x09');
  Expect.isFalse(@'\v' === '\x0B');
  Expect.isFalse(@'\f' === '\x0C');

  Expect.isFalse(@"\x61" === 'a');
  Expect.isTrue(@"\x61" === '\x5c\x78\x36\x31');
  Expect.isFalse(@"\x62" === 'b');
  Expect.isFalse(@"\x63" === 'c');
  Expect.isFalse(@"\x64" === 'd');

  Expect.isFalse(@'\u2295' === '⊕');
  Expect.isTrue(@'\u2295' === '\x5c\x752295');
  Expect.isFalse(@'\u2296' === '⊖');
  Expect.isFalse(@'\u2297' === '⊗');
  Expect.isFalse(@'\u2298' === '⊘');

  Expect.isFalse(@'\u{100}' === 'Ā');
  Expect.isTrue(@'\u{100}' === '\x5c\x75{100}');
  Expect.isFalse(@'\u{101}' === 'ā');
  Expect.isFalse(@'\u{102}' === 'Ă');
  Expect.isFalse(@'\u{103}' === 'ă');
}
