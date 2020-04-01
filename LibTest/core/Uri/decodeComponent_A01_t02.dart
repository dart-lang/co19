/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String decodeComponent(String encodedComponent)
 * Decodes the percent-encoding in encodedComponent.
 * @description Checks expected results on unreserved characters and
 * basic and extended unicode characters on manually and library
 * encoded strings.
 * @author sgrekhov@unipro.ru
 */
import 'dart:convert';
import "../../../Utils/expect.dart";

String unreserved = "0123456789"
                    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                    "abcdefghijklmnopqrstuvwxyz"
                    "-._~";

encodeOctet(int x) =>
  x < 0x10 ? '%0${x.toRadixString(16)}' : '%${x.toRadixString(16)}';

manuallyEncode(String s) => s.runes
  .map((x) =>
      unreserved.runes.contains(x)
      ? new String.fromCharCode(x)
      : utf8.encode(new String.fromCharCode(x)).map(encodeOctet).join(''))
  .join('');

main() {
  for (int i = 0; i < 65279; i++) {
    if ((i & 0xF800) == 0xD800) {
      // Skip surrogates.
      continue;
    }
    String char = new String.fromCharCode(i);
    String encoded = Uri.encodeComponent(char);
    Expect.equals(char, Uri.decodeComponent(encoded), "Failed for $i");
    Expect.equals(char, Uri.decodeComponent(manuallyEncode(char)),
        "Failed for $i");
  }
}
