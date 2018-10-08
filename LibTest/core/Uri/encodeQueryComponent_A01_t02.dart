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
 * @description Compare library result with manually encoded string on
 * characters from Unicode Basic Multilingual Plane
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

tryRange(start, end) {
  for (var i=start; i<=end; ++i) {
    var s = new String.fromCharCode(i);
    Expect.equals(manuallyEncodeQuery(s), Uri.encodeQueryComponent(s));
  }
}

main() {
  tryRange(0, 0xD7FF);
  tryRange(0xE000, 0xFFFF);
}
