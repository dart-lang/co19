/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String encodeQueryComponent(String component)
 * Encode the string component according to the HTML 4.01 rules for encoding
 * the posting of a HTML form as a query string component.
 * Spaces will be replaced with plus and all characters except
 * for uppercase and lowercase letters, decimal digits and the characters -._~.
 * @description Checks that space, unreserved characters, basic and extended
 * unicode characters are correctly encoded
 * @author ilya
 */
import 'dart:convert';
import "../../../Utils/expect.dart";

String unreserved = "0123456789"
                    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                    "abcdefghijklmnopqrstuvwxyz"
                    "-._~";

encodeOctet(int x) =>
  (x < 0x10 ? '%0${x.toRadixString(16)}' : '%${x.toRadixString(16)}')
  .toUpperCase();

manuallyEncodeQuery(String s) => s.runes
  .map((x) =>
      unreserved.runes.contains(x)
      ? new String.fromCharCode(x)
      : x == 32
        ? '+'
        : utf8.encode(new String.fromCharCode(x)).map(encodeOctet).join(''))
  .join('');


main() {
  var x = '$unreserved \u1111\u2222\u3333\u{10000}\u{10001}';
  Expect.equals(manuallyEncodeQuery(x), Uri.encodeQueryComponent(x));
}
