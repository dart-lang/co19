/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String encodeComponent(String component)
 * Encode the string component using percent-encoding to make it safe for
 * literal use as a URI component.
 * All characters except uppercase and lowercase letters, digits and
 * the characters !$&'()*+,;=:@ are percent-encoded.
 * @description Checks that basic and extended unicode characters are encoded
 * @author ilya
 * @reviewer
 */

import 'dart:utf';
import "../../../Utils/expect.dart";

encodeOctet(int x) =>
  (x < 0x10 ? '%0${x.toRadixString(16)}' : '%${x.toRadixString(16)}')
  .toUpperCase();

manuallyEncodeFull(String s) => s.runes
  .map((x) =>
      encodeUtf8(new String.fromCharCode(x)).map(encodeOctet).join(''))
  .join('');

main() {
  var x = '\u1111\u2222\u3333\u{10000}\u{10001}';
  Expect.equals(manuallyEncodeFull(x), Uri.encodeComponent(x));
}