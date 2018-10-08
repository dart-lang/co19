/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String encodeFull(String uri)
 * Encode the string uri using percent-encoding to make it safe for literal
 * use as a full URI.
 * All characters except uppercase and lowercase letters, digits
 * and the characters !$&'()*+,-./:;=?@_~ are percent-encoded.
 * @description Checks that basic and extended unicode characters are encoded
 * @author ilya
 */
import 'dart:convert';
import "../../../Utils/expect.dart";

encodeOctet(int x) =>
  (x < 0x10 ? '%0${x.toRadixString(16)}' : '%${x.toRadixString(16)}')
  .toUpperCase();

manuallyEncodeFull(String s) => s.runes
  .map((x) =>
      utf8.encode(new String.fromCharCode(x)).map(encodeOctet).join(''))
  .join('');

main() {
  var x = '\u1111\u2222\u3333\u{10000}\u{10001}';
  Expect.equals(manuallyEncodeFull(x), Uri.encodeFull(x));
}
